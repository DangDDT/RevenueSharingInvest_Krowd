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
                      "Dự án",
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
                  "Ghi chú đầu tư",
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
                  "Tiền đầu tư",
                ),
                trailing: Text(
                  "${formatter.format(project.investedAmount)} đ",
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
                          "Hệ số nhân",
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
                          "Tiền nhận được dự kiến",
                        ),
                        trailing: Text(
                          "${formatter.format(project.expectedReturn)} đ",
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
                                title: Text("Đã thanh toán"),
                                trailing: Text(
                                  "${formatter.format(project.returnedAmount)} đ",
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
                                title: Text("Nợ tối thiểu"),
                                trailing: Text(
                                  "${formatter.format(project.mustPaidDept)} đ",
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
                                title: Text("Nợ cộng lãi"),
                                trailing: Text(
                                  "${formatter.format(project.profitableDebt)} đ",
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
                                title: Text("Số kì thanh toán"),
                                trailing: Text(
                                  "${project.numOfStage} kỳ",
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
                                title: Text("Số kỳ đã thanh toán"),
                                trailing: Text(
                                  project.numOfPayedStage == 0
                                      ? "Chưa từng thanh toán"
                                      : "${project.numOfPayedStage} kỳ",
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
                                title: Text("Thanh toán gần nhất"),
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
                  "Lịch sử đầu tư",
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
                  "Bạn đã mua ${project.investmentRecords!.map((e) => e.quantity).reduce((a, b) => a! + b!)} gói đầu tư:",
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
                            Text("${ir.quantity} gói"),
                            SizedBox(height: 10),
                            Text("${ir.createDate}"),
                          ],
                        ),
                        trailing: Text(
                          "${formatter.format(ir.totalPrice)} đ",
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
                          "$numOfPackage gói",
                        ),
                        trailing: Text(
                          "${formatter.format(totalPrice)} đ",
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
                      "Tạm tính:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      "${formatter.format(totalPriceAll)} đ",
                      style: TextStyle(
                          fontSize: kFontSize - 2,
                          fontWeight: FontWeight.bold,
                          color: bGreen),
                    ),
                  ),
                  ListTile(
                    dense: true,
                    title: Text(
                      "Đã huỷ:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      "- ${formatter.format(totalPriceAll - project.investedAmount!)} đ",
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
                  "Tổng tiền đầu tư:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Text(
                  "${formatter.format(project.investedAmount)} đ",
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
