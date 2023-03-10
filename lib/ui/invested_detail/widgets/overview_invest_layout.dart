import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/models/projects/invested_project_detail/investment_record.dart';
import 'package:rsi/ui/_common/dashline_separator.dart';
import 'package:rsi/ui/_common/loading/circular_loading.dart';
import 'package:rsi/ui/_common/pull_refresh.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart' as intl;

class OverviewInvestLayout extends StatefulWidget {
  final String projectId;
  const OverviewInvestLayout({Key? key, required this.projectId})
      : super(key: key);

  @override
  State<OverviewInvestLayout> createState() => _OverviewInvestLayoutState();
}

class _OverviewInvestLayoutState extends State<OverviewInvestLayout> {
  @override
  void initState() {
    context.read<InvestedProjectDetailCubit>()
      ..fetchInvestedProjectDetail(widget.projectId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PullRefresh(
      action: () => context
          .read<InvestedProjectDetailCubit>()
          .fetchInvestedProjectDetail(widget.projectId),
      child: SingleChildScrollView(
        child:
            BlocBuilder<InvestedProjectDetailCubit, InvestedProjectDetailState>(
          builder: (context, state) {
            switch (state.status) {
              case InvestedProjectDetailStatus.loading:
                return CircularLoading();
              case InvestedProjectDetailStatus.success:
                return renderSuccess(context, state);
              case InvestedProjectDetailStatus.failure:
                return renderFailure();
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }

  Widget renderSuccess(BuildContext context, InvestedProjectDetailState state) {
    final project = state.project!;
    final basicProject = context
        .read<FetchInvestedProjectCubit>()
        .state
        .projects!
        .firstWhere((e) => e.id == widget.projectId);
    final formatter = intl.NumberFormat.decimalPattern();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: nWhite,
              borderRadius: BorderRadius.circular(kBorder),
              boxShadow: kBoxShadow,
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(kBorder),
                      topRight: Radius.circular(kBorder)),
                  child: Image.network(
                    project.projectImage.toString(),
                    width: 100.w,
                    fit: BoxFit.cover,
                  ),
                ),
                ListTile(
                  dense: true,
                  minVerticalPadding: 10,
                  title: Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Text(
                      "D??? ??n",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: kFontSize,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                  subtitle: Text(
                    project.projectName.toString(),
                    style: TextStyle(
                      fontSize: kFontSize - 2,
                      color: kDarkTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Text(
                    renderProjectStatus[project.projectStatus.toString()]!
                        .elementAt(0),
                    style: TextStyle(
                      fontSize: kFontSize - 2,
                      color:
                          renderProjectStatus[project.projectStatus.toString()]!
                              .elementAt(2),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: nWhite,
              borderRadius: BorderRadius.circular(kBorder),
              boxShadow: kBoxShadow,
            ),
            child: Column(children: [
              ListTile(
                dense: true,
                title: Text(
                  "Ghi ch?? ?????u t??",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: kFontSize,
                    color: kPrimaryColor,
                  ),
                ),
              ),
              Divider(
                height: 0,
              ),
              ListTile(
                dense: true,
                title: Text(
                  "Ti???n ?????u t??",
                ),
                trailing: Text(
                  "${formatter.format(project.investedAmount)} ??",
                  style: TextStyle(fontSize: kFontSize - 2),
                ),
              ),
              Builder(builder: (context) {
                if (project.projectStatus == "CALLING_FOR_INVESTMENT" ||
                    project.projectStatus == "ACTIVE") {
                  return Column(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: kDefaultPadding),
                        child: DashLineSeparator(
                          color: nGray2,
                        ),
                      ),
                      ListTile(
                        dense: true,
                        title: Text(
                          "H??? s??? nh??n",
                        ),
                        trailing: Text(
                          "${basicProject.multiplier} x",
                          style: TextStyle(fontSize: kFontSize - 2),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: kDefaultPadding),
                        child: DashLineSeparator(
                          color: nGray2,
                        ),
                      ),
                      ListTile(
                        dense: true,
                        title: Text(
                          "Ti???n nh???n ???????c d??? ki???n",
                        ),
                        trailing: Text(
                          "${formatter.format(project.expectedReturn)} ??",
                          style: TextStyle(fontSize: kFontSize - 2),
                        ),
                      ),
                      Builder(builder: (context) {
                        if (project.projectStatus == "ACTIVE") {
                          return Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: kDefaultPadding),
                                child: DashLineSeparator(
                                  color: nGray2,
                                ),
                              ),
                              ListTile(
                                dense: true,
                                title: Text("???? thanh to??n"),
                                trailing: Text(
                                  "${formatter.format(project.returnedAmount)} ??",
                                  style: TextStyle(fontSize: kFontSize - 2),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: kDefaultPadding),
                                child: DashLineSeparator(
                                  color: nGray2,
                                ),
                              ),
                              ListTile(
                                dense: true,
                                title: Text("N??? t???i thi???u"),
                                trailing: Text(
                                  "${formatter.format(project.mustPaidDept)} ??",
                                  style: TextStyle(fontSize: kFontSize - 2),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: kDefaultPadding),
                                child: DashLineSeparator(
                                  color: nGray2,
                                ),
                              ),
                              ListTile(
                                dense: true,
                                title: Text("N??? c???ng l??i"),
                                trailing: Text(
                                  "${formatter.format(project.profitableDebt)} ??",
                                  style: TextStyle(fontSize: kFontSize - 2),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: kDefaultPadding),
                                child: DashLineSeparator(
                                  color: nGray2,
                                ),
                              ),
                              ListTile(
                                dense: true,
                                title: Text("S??? k?? thanh to??n"),
                                trailing: Text(
                                  "${project.numOfStage} k???",
                                  style: TextStyle(fontSize: kFontSize - 2),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: kDefaultPadding),
                                child: DashLineSeparator(
                                  color: nGray2,
                                ),
                              ),
                              ListTile(
                                dense: true,
                                title: Text("S??? k??? ???? thanh to??n"),
                                trailing: Text(
                                  project.numOfPayedStage == 0
                                      ? "Ch??a t???ng thanh to??n"
                                      : "${project.numOfPayedStage} k???",
                                  style: TextStyle(fontSize: kFontSize - 2),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: kDefaultPadding),
                                child: DashLineSeparator(
                                  color: nGray2,
                                ),
                              ),
                              ListTile(
                                dense: true,
                                title: Text("Thanh to??n g???n nh???t"),
                                trailing: Text(
                                  project.latestPayment.toString(),
                                  style: TextStyle(fontSize: kFontSize - 2),
                                ),
                              ),
                            ],
                          );
                        } else
                          return SizedBox(height: 0);
                      }),
                    ],
                  );
                } else {
                  return SizedBox(height: 0);
                }
              }),
            ]),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: nWhite,
              borderRadius: BorderRadius.circular(kBorder),
              boxShadow: kBoxShadow,
            ),
            child: Column(children: [
              ListTile(
                dense: true,
                title: Text(
                  "L???ch s??? ?????u t??",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: kFontSize,
                    color: kPrimaryColor,
                  ),
                ),
              ),
              Divider(
                height: 0,
              ),
              ListTile(
                dense: true,
                title: Text(
                  "B???n ???? mua ${project.investmentRecords!.map((e) => e.quantity).reduce((a, b) => a! + b!)} g??i ?????u t??:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: project.investmentRecords!.length < 4
                    ? 10.h * project.investmentRecords!.length
                    : 40.h,
                child: ListView.separated(
                    physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final ir = project.investmentRecords!.elementAt(index);
                      return ListTile(
                        dense: true,
                        isThreeLine: true,
                        minLeadingWidth: 10,
                        leading: Icon(
                          Icons.label,
                          color: kSecondaryColor,
                        ),
                        title: Text(
                          ir.packageName.toString(),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${ir.quantity} g??i"),
                            SizedBox(height: 10),
                            Text("${ir.createDate}"),
                          ],
                        ),
                        trailing: Text(
                          "${formatter.format(ir.totalPrice)} ??",
                          style: TextStyle(fontSize: kFontSize - 2),
                        ),
                      );
                    },
                    itemCount: project.investmentRecords!.length,
                    separatorBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(left: 60),
                          child: DashLineSeparator(color: nGray3),
                        )),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 20,
                child: DashLineSeparator(
                  color: nGray5,
                ),
              ),
              Builder(builder: (context) {
                num totalPriceAll = 0;
                final group = groupBy(state.project!.investmentRecords!,
                    (InvestmentRecord e) {
                  return e.packageName;
                });
                final keys = group.keys.toList();
                return Column(children: [
                  ...keys.map((e) {
                    num numOfPackage = 0;
                    num totalPrice = 0;
                    try {
                      numOfPackage = group[e]!
                              .map((e) => e.quantity)
                              .reduce((a, b) => a! + b!) ??
                          0;
                      totalPrice = group[e]!
                              .map((e) => e.totalPrice)
                              .reduce((a, b) => a! + b!) ??
                          0;
                      totalPriceAll += totalPrice;
                    } catch (e) {
                      numOfPackage = 0;
                      totalPrice = 0;
                    }
                    return ListTile(
                        dense: true,
                        title: Text(
                          "$e",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: kFontSize - 2),
                        ),
                        subtitle: Text(
                          "$numOfPackage g??i",
                        ),
                        trailing: Text(
                          "${formatter.format(totalPrice)} ??",
                          style: TextStyle(
                              fontSize: kFontSize - 2,
                              fontWeight: FontWeight.bold),
                        ));
                  }).toList(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 20,
                    child: DashLineSeparator(
                      color: nGray5,
                    ),
                  ),
                  ListTile(
                    dense: true,
                    title: Text(
                      "T???m t??nh:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      "${formatter.format(totalPriceAll)} ??",
                      style: TextStyle(
                          fontSize: kFontSize - 2,
                          fontWeight: FontWeight.bold,
                          color: bGreen),
                    ),
                  ),
                  ListTile(
                    dense: true,
                    title: Text(
                      "???? hu???:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      "- ${formatter.format(totalPriceAll - project.investedAmount!)} ??",
                      style: TextStyle(
                          fontSize: kFontSize - 2,
                          fontWeight: FontWeight.bold,
                          color: bRed),
                    ),
                  ),
                ]);
              }),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 20,
                child: DashLineSeparator(
                  color: nGray5,
                ),
              ),
              ListTile(
                dense: true,
                title: Text(
                  "T???ng ti???n ?????u t??:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Text(
                  "${formatter.format(project.investedAmount)} ??",
                  style: TextStyle(
                      fontSize: kFontSize - 2,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget renderFailure() {
    return Container();
  }
}
