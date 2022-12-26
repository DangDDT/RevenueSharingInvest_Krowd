// ignore_for_file: non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rsi/models/models.dart';
import 'package:rsi/resources/repository.dart';

part 'bill_state.dart';

class BillCubit extends Cubit<BillState> {
  final Repository repository = new Repository();
  BillCubit() : super(const BillState(bills: [], selectedRows: []));
  init() {
    emit(BillState(bills: [], selectedRows: []));
  }

  fetchBills({required dailyReportId}) async {
    emit(state.copyWith(status: BillStatus.loading));

    try {
      final tuple2_numOfBill_bills =
          await repository.fetchBills(dailyReportId: dailyReportId);
      final numOfBill = tuple2_numOfBill_bills.item1;
      final bills = tuple2_numOfBill_bills.item2;
      emit(state.copyWith(
          status: BillStatus.success, bills: bills, numOfBill: numOfBill));
    } catch (e) {
      emit(state.copyWith(status: BillStatus.failure));
    }
  }

  onSelectRow(String billId) {
    final indexOf = state.selectedRows.indexOf(billId);
    final selectedRows = [...state.selectedRows];
    if (indexOf == -1) {
      selectedRows.add(billId);
    } else {
      selectedRows.removeAt(indexOf);
    }
    emit(state.copyWith(selectedRows: selectedRows));
  }
}
