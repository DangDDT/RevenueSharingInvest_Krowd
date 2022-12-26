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
                          "Bạn đã đầu tư ${formatter.format(investment.totalPrice)} đ",
                          style: TextStyle(
                            fontSize: kFontSize,
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor,
                          ),
                        ),
                        Text(
                            investment.status == "SUCCESS"
                                ? "Thành công"
                                : "Đã hủy đầu tư",
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
                            "Vào dự án: ${investment.projectName}",
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
                        title: Text('Tên gói:',
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
                        title: Text('Số gói:',
                            style: TextStyle(
                                fontSize: kFontSize - 2, color: nGray6)),
                        trailing: Text("${investment.quantity} gói",
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
                        title: Text('Giá trị gói:',
                            style: TextStyle(
                                fontSize: kFontSize - 2, color: nGray6)),
                        trailing: Text(
                            "${formatter.format(investment.packagePrice)} đ/gói",
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
                        title: Text('Mua vào lúc:',
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
                        title: Text('Trạng thái dự án:',
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
                            title: Text('Hủy đầu tư vào lúc:',
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
                            title: Text('Bạn muốn hủy đầu tư ?',
                                style: TextStyle(
                                    fontSize: kFontSize - 2, color: bOrange)),
                            subtitle: Text(
                                '(*) Bạn có thể hủy đầu tư trong vòng 24h.',
                                style: TextStyle(
                                    fontSize: kFontSize - 4, color: nGray6)),
                            trailing: ElevatedButton(
                              child: Text(
                                "Hủy đầu tư",
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
          title: const Text('Bạn chắc chắn muốn hủy đầu tư không ?',
              style: TextStyle(fontSize: kFontSize)),
          content: Container(
            height: 30.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Text('(*) Lưu ý',
                        style: TextStyle(fontSize: kFontSize - 2))),
                Builder(builder: (context) {
                  final texts = [
                    "Giao dịch đầu tư của bạn sẽ bị hủy.",
                    "Số tiền đầu tư sẽ được hoàn trả từ ví tạm ứng của bạn về ví đầu tư chung. Vui lòng kiểm tra số dư ví.",
                    "Gói đầu tư sẽ được hoàn tác lại cho dự án kêu gọi cho giao dịch lần sau của bạn hoặc của nhà đầu tư khác."
                        "Mọi thắc mắc về việc huỷ đầu tư vui lòng liên hệ dịch vụ chăm sóc khách hàng của công ty Krowd",
                    "Cuối cùng, thao tác này sẽ không thể hoàn tác vui lòng kiểm tra kĩ trước khi xác nhận",
                  ];
                  return UnorderedList(texts);
                })
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Không muốn'),
            ),
            TextButton(
              onPressed: () => onSubmit(investmentId),
              child: const Text('Xác nhận hủy đầu tư',
                  style: TextStyle(color: bRed)),
            ),
          ],
        ),
      );
}
