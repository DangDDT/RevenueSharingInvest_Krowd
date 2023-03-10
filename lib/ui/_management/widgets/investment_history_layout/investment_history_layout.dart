import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/router/router_constants.dart';
import 'package:rsi/ui/_common/loading/circular_loading.dart';
import 'package:rsi/ui/_common/pull_refresh.dart';
import 'package:intl/intl.dart' as intl;
import 'package:rsi/ui/_common/unordered_list.dart';
import 'package:sizer/sizer.dart';

class InvestmentHistoryLayout extends StatefulWidget {
  const InvestmentHistoryLayout({Key? key}) : super(key: key);

  @override
  State<InvestmentHistoryLayout> createState() =>
      _InvestmentHistoryLayoutState();
}

class _InvestmentHistoryLayoutState extends State<InvestmentHistoryLayout> {
  @override
  void initState() {
    context.read<InvestmentCubit>().fetchInvestment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PullRefresh(
      action: () => context.read<InvestmentCubit>().fetchInvestment(),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Column(
          children: [
            BlocBuilder<InvestmentCubit, InvestmentState>(
              builder: (context, state) {
                switch (state.status) {
                  case InvestmentStatus.loading:
                    return loadingWidget();
                  case InvestmentStatus.success:
                    if (state.numOfInvestment == 0 ||
                        state.investments.length == 0)
                      return emptyWidget();
                    else
                      return successWidget();
                  case InvestmentStatus.failure:
                    return failureWidget();
                  default:
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget loadingWidget() {
    return Container(height: 70.h, child: CircularLoading());
  }

  Widget successWidget() {
    final formatter = intl.NumberFormat.decimalPattern();
    final f = intl.DateFormat('dd/MM/yyyy hh:mm:ss');
    return BlocBuilder<InvestmentCubit, InvestmentState>(
      builder: (context, state) {
        final investments = state.investments;
        return Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final investment = investments.elementAt(index);
              final investmentTimeStamp = f
                  .parse(investment.createDate.toString())
                  .millisecondsSinceEpoch;
              final currentTimeStamp = DateTime.now().millisecondsSinceEpoch;
              const timeStampOneDay = 24 * 60 * 60 * 1000;
              final projectStatus = context
                  .read<FetchInvestedProjectCubit>()
                  .state
                  .projects!
                  .firstWhere((e) => investment.projectId == e.id)
                  .status;
              // ignore: unrelated_type_equality_checks
              final isCallingAvailable =
                  projectStatus == "CALLING_FOR_INVESTMENT" ? true : false;
              final canBeCancel =
                  (currentTimeStamp - investmentTimeStamp <= timeStampOneDay) &&
                      isCallingAvailable;
              return Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: nWhite,
                  borderRadius: BorderRadius.circular(kBorder),
                  boxShadow: kBoxShadow,
                ),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "B???n ???? ?????u t?? ${formatter.format(investment.totalPrice)} ??",
                          style: TextStyle(
                            fontSize: kFontSize,
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor,
                          ),
                        ),
                        Text(
                            investment.status == "SUCCESS"
                                ? "Th??nh c??ng"
                                : "???? h???y ?????u t??",
                            style: TextStyle(
                                fontSize: kFontSize - 4,
                                fontWeight: FontWeight.bold,
                                color: investment.status == "SUCCESS"
                                    ? bGreen
                                    : bRed)),
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            "V??o d??? ??n: ${investment.projectName}",
                            style: TextStyle(
                              fontSize: kFontSize - 2,
                              color: kDarkTextColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            "${investment.createDate}",
                            style: TextStyle(
                                fontSize: kFontSize - 4, color: nGray6),
                          ),
                        ),
                      ],
                    ),
                    children: <Widget>[
                      ListTile(
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -4),
                        dense: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                        title: Text('T??n g??i:',
                            style: TextStyle(
                                fontSize: kFontSize - 2, color: nGray6)),
                        trailing: Text("${investment.packageName}",
                            style: TextStyle(
                                fontSize: kFontSize - 2,
                                fontWeight: FontWeight.bold)),
                      ),
                      ListTile(
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -4),
                        dense: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                        title: Text('S??? g??i:',
                            style: TextStyle(
                                fontSize: kFontSize - 2, color: nGray6)),
                        trailing: Text("${investment.quantity} g??i",
                            style: TextStyle(
                                fontSize: kFontSize - 2,
                                fontWeight: FontWeight.bold)),
                      ),
                      ListTile(
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -4),
                        dense: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                        title: Text('Gi?? tr??? g??i:',
                            style: TextStyle(
                                fontSize: kFontSize - 2, color: nGray6)),
                        trailing: Text(
                            "${formatter.format(investment.packagePrice)} ??/g??i",
                            style: TextStyle(
                                fontSize: kFontSize - 2,
                                fontWeight: FontWeight.bold)),
                      ),
                      ListTile(
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -4),
                        dense: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                        title: Text('Mua v??o l??c:',
                            style: TextStyle(
                                fontSize: kFontSize - 2, color: nGray6)),
                        trailing: Text("${investment.createDate}",
                            style: TextStyle(
                                fontSize: kFontSize - 2,
                                fontWeight: FontWeight.bold)),
                      ),
                      ListTile(
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -4),
                        dense: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                        title: Text('Tr???ng th??i d??? ??n:',
                            style: TextStyle(
                                fontSize: kFontSize - 2, color: nGray6)),
                        trailing: Text(
                            "${renderProjectStatus[projectStatus]!.elementAt(0)}",
                            style: TextStyle(
                                fontSize: kFontSize - 2,
                                fontWeight: FontWeight.bold,
                                color: renderProjectStatus[projectStatus]!
                                    .elementAt(2))),
                      ),
                      Builder(builder: (context) {
                        if (investment.status == "CANCELED")
                          return ListTile(
                            visualDensity:
                                VisualDensity(horizontal: 0, vertical: -4),
                            dense: true,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 15),
                            title: Text('H???y ?????u t?? v??o l??c:',
                                style: TextStyle(
                                    fontSize: kFontSize - 2, color: nGray6)),
                            trailing: Text("${investment.updateDate}",
                                style: TextStyle(
                                    fontSize: kFontSize - 2,
                                    fontWeight: FontWeight.bold)),
                          );
                        else
                          return SizedBox(height: 0);
                      }),
                      Builder(builder: (context) {
                        if (canBeCancel && investment.status == "SUCCESS")
                          return ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 15),
                            title: Text('B???n mu???n h???y ?????u t?? ?',
                                style: TextStyle(
                                    fontSize: kFontSize - 2, color: bOrange)),
                            subtitle: Text(
                                '(*) B???n c?? th??? h???y ?????u t?? trong v??ng 24h.',
                                style: TextStyle(
                                    fontSize: kFontSize - 4, color: nGray6)),
                            trailing: ElevatedButton(
                              child: Text(
                                "H???y ?????u t??",
                                style: TextStyle(fontSize: kFontSize - 2),
                              ),
                              onPressed: () =>
                                  _showDialog(context, investment.id!),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: bRed,
                                padding: EdgeInsets.symmetric(
                                    horizontal: kDefaultPadding),
                              ),
                            ),
                          );
                        else
                          return SizedBox(height: 0);
                      })
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemCount: state.investments.length,
          ),
        );
      },
    );
  }

  Widget emptyWidget() {
    return Container();
  }

  Widget failureWidget() {
    return Container();
  }

  void onSubmit(String investmentId) {
    context.loaderOverlay.show();
    context.read<InvestmentCubit>()
      ..cancelInvestment(investmentId).whenComplete(() {
        context.loaderOverlay.hide();
        Navigator.pushNamed(context, cancelInvestmentStatusRoute);
      });
  }

  void _showDialog(BuildContext context, String investmentId) =>
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('B???n ch???c ch???n mu???n h???y ?????u t?? kh??ng ?',
              style: TextStyle(fontSize: kFontSize)),
          content: Container(
            height: 30.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Text('(*) L??u ??',
                        style: TextStyle(fontSize: kFontSize - 2))),
                Builder(builder: (context) {
                  final texts = [
                    "Giao d???ch ?????u t?? c???a b???n s??? b??? h???y.",
                    "S??? ti???n ?????u t?? s??? ???????c ho??n tr??? t??? v?? t???m ???ng c???a b???n v??? v?? ?????u t?? chung. Vui l??ng ki???m tra s??? d?? v??.",
                    "G??i ?????u t?? s??? ???????c ho??n t??c l???i cho d??? ??n k??u g???i cho giao d???ch l???n sau c???a b???n ho???c c???a nh?? ?????u t?? kh??c."
                        "M???i th???c m???c v??? vi???c hu??? ?????u t?? vui l??ng li??n h??? d???ch v??? ch??m s??c kh??ch h??ng c???a c??ng ty Krowd",
                    "Cu???i c??ng, thao t??c n??y s??? kh??ng th??? ho??n t??c vui l??ng ki???m tra k?? tr?????c khi x??c nh???n",
                  ];
                  return UnorderedList(texts);
                })
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Kh??ng mu???n'),
            ),
            TextButton(
              onPressed: () => onSubmit(investmentId),
              child: const Text('X??c nh???n h???y ?????u t??',
                  style: TextStyle(color: bRed)),
            ),
          ],
        ),
      );
}
