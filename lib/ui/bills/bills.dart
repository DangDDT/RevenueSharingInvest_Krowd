import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:intl/intl.dart' as intl;
import 'package:rsi/ui/_common/loading/circular_loading.dart';
import 'package:sizer/sizer.dart';

class BillsScreen extends StatefulWidget {
  final String dailyReportId;
  const BillsScreen({Key? key, required this.dailyReportId}) : super(key: key);

  @override
  State<BillsScreen> createState() => _BillsScreenState();
}

class _BillsScreenState extends State<BillsScreen> {
  void _loadData() {
    final dailyReportId = widget.dailyReportId;
    context.read<BillCubit>()
      ..init()
      ..fetchBills(dailyReportId: dailyReportId);
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final formatter = intl.NumberFormat.decimalPattern();
    return Scaffold(
      appBar: AppBar(
        title: Text("Chi tiết báo cáo"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: BlocBuilder<BillCubit, BillState>(
          builder: (context, state) {
            if (state.status == BillStatus.loading)
              return CircularLoading();
            else if (state.status == BillStatus.failure)
              return Container();
            else if (state.status == BillStatus.success && state.numOfBill == 0)
              return Container(
                color: kBackgroundColor,
                height: 80.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      EMPTY_IMAGE,
                      width: 250,
                      height: 250,
                    ),
                    Center(
                      child: Text(
                        'Báo cáo này không có hóa đơn nào',
                        style: TextStyle(fontSize: kFontSize),
                      ),
                    ),
                  ],
                ),
              );
            return Column(
              children: [
                ListTile(
                  title: Text("Tổng số hóa đơn"),
                  trailing: Text("${state.numOfBill} hóa đơn"),
                ),
                ListTile(
                  title: Text("Tổng tiền các hóa đơn"),
                  trailing: Text(
                      "${formatter.format(state.bills.map((e) => e.amount).reduce((a, b) => a! + b!))} đ"),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columnSpacing: 10,
                    headingTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kDarkTextColor,
                      fontStyle: FontStyle.italic,
                    ),
                    dataTextStyle: TextStyle(
                      color: kDarkTextColor,
                      fontSize: kFontSize - 2,
                    ),
                    columns: [
                      DataColumn(
                        label: Text(
                          'STT',
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Mã hóa đơn',
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Số tiền',
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Tạo bởi',
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Tạo lúc',
                        ),
                      ),
                    ],
                    rows: state.bills.map(
                      (row) {
                        int idx = state.bills.indexOf(row) + 1;
                        return DataRow(
                          onSelectChanged: (isSelected) =>
                              context.read<BillCubit>()..onSelectRow(row.id!),
                          selected: state.selectedRows.contains(row.id),
                          cells: [
                            DataCell(
                              Container(
                                width: 30,
                                child: Text(
                                  idx.toString(),
                                ),
                              ),
                            ),
                            DataCell(Container(
                                width: 150,
                                child: Text(row.invoiceId.toString()))),
                            DataCell(Text("${formatter.format(row.amount)} đ")),
                            DataCell(
                              Text(
                                row.createBy.toString(),
                              ),
                            ),
                            DataCell(
                              Text(
                                row.createDate.toString(),
                              ),
                            ),
                          ],
                        );
                      },
                    ).toList(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
