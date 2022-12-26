import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:rsi/blocs/cubit/report_revenue/report_revenue_cubit.dart';
import 'package:rsi/foundation/constants.dart';
import 'dart:math' as math;
import 'package:intl/intl.dart' as intl;
import 'package:rsi/router/router_constants.dart';
import 'package:rsi/ui/_common/loading/circular_loading.dart';
import 'package:sizer/sizer.dart';

class ReportRevenueLayout extends StatefulWidget {
  final String projectId;
  const ReportRevenueLayout({Key? key, required this.projectId})
      : super(key: key);

  @override
  State<ReportRevenueLayout> createState() => _ReportRevenueLayoutState();
}

class _ReportRevenueLayoutState extends State<ReportRevenueLayout> {
  void _loadData() {
    final projectId = widget.projectId;
    context.read<ReportRevenueCubit>()
      ..init(projectId: projectId)
      ..fetchDailyReport();
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportRevenueCubit, ReportRevenueState>(
      builder: (context, state) {
        switch (state.status) {
          case ReportRevenueStatus.prepareInit:
            return CircularLoading();
          case ReportRevenueStatus.loading:
            return CircularLoading();
          case ReportRevenueStatus.success:
            if (state.dailyReports.length == 0)
              return renderEmpty();
            else
              return renderAvailable(context, state);
          case ReportRevenueStatus.loading:
            return CircularLoading();
          default:
            return Container();
        }
      },
    );
  }

  Widget renderAvailable(BuildContext context, ReportRevenueState state) {
    final formatter = intl.NumberFormat.decimalPattern();
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding, vertical: 5),
              child: ListTile(
                onTap: () => showMaterialRadioPicker<String>(
                  context: context,
                  title: 'LỌC THEO KỲ',
                  items: state.stages.map((_e) => _e.name!).toList(),
                  selectedItem: state.selectedStage!.name,
                  onChanged: context.read<ReportRevenueCubit>().onStageChange,
                  confirmText: "CHỌN",
                  cancelText: "ĐÓNG",
                ),
                contentPadding: EdgeInsets.all(0),
                minLeadingWidth: 0,
                leading: Image.asset(
                  "assets/icons/filter.png",
                  color: nGray5,
                ),
                title: Text(
                  state.selectedStage!.name.toString(),
                  style: TextStyle(fontSize: kFontSize),
                ),
                trailing: IconButton(
                  icon: Transform.rotate(
                      angle: -math.pi / 2, child: Icon(BACKWARD_ICON)),
                  onPressed: () => showMaterialRadioPicker<String>(
                    context: context,
                    title: 'LỌC THEO KỲ',
                    items: state.stages.map((_e) => _e.name!).toList(),
                    selectedItem: state.selectedStage!.name,
                    onChanged: context.read<ReportRevenueCubit>().onStageChange,
                    confirmText: "CHỌN",
                    cancelText: "ĐÓNG",
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding, vertical: 5),
              alignment: Alignment.centerLeft,
              child: Text(
                "(*) Nhấn và giữ hàng \"đã báo cáo\" để xem chi tiết.",
                style: TextStyle(color: nGray5),
              ),
            ),
            BlocBuilder<ReportRevenueCubit, ReportRevenueState>(
              builder: (context, state) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    child: DataTable(
                      headingTextStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kDarkTextColor,
                        fontStyle: FontStyle.italic,
                        fontSize: kFontSize,
                      ),
                      dataTextStyle: TextStyle(
                        color: kDarkTextColor,
                        fontSize: kFontSize - 2,
                      ),
                      columnSpacing: 11.w,
                      columns: [
                        DataColumn(
                          label: Text(
                            'STT',
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Ngày',
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Doanh thu',
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Trạng thái',
                          ),
                        ),
                      ],
                      rows: [
                        ...state.dailyReports.map(
                          (row) {
                            int idx = state.dailyReports.indexOf(row) + 1;
                            return DataRow(
                              onLongPress: row.status == "REPORTED"
                                  ? () => Navigator.pushNamed(
                                      context, billsRoute,
                                      arguments: row.id)
                                  : null,
                              cells: [
                                DataCell(
                                  Container(
                                    width: 30,
                                    child: Text(
                                      idx.toString(),
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    row.reportDate.toString().substring(0, 10),
                                  ),
                                ),
                                DataCell(
                                    Text("${formatter.format(row.amount)} đ")),
                                DataCell(
                                  Text(
                                    renderReportStatus[row.status.toString()]!
                                        .elementAt(0)
                                        .toString(),
                                    style: TextStyle(
                                      color: renderReportStatus[
                                              row.status.toString()]!
                                          .elementAt(2),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ).toList(),
                        DataRow(
                          cells: [
                            DataCell(
                              Text(
                                "Tổng",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            DataCell(
                              Text(
                                "${state.dailyReports.length} ngày",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            DataCell(
                              Text(
                                "${formatter.format(state.dailyReports.map((e) => e.amount).reduce((a, b) => a + b))} đ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            DataCell(Text("")),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget renderEmpty() {
    return Container(
      color: kBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            EMPTY_IMAGE,
            width: 300,
            height: 250,
          ),
          Center(
            child: Text(
              'Hiện không có báo cáo nào cả !!!',
              style: TextStyle(fontSize: kFontSize),
            ),
          ),
        ],
      ),
    );
  }
}
