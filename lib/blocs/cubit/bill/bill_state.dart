part of 'bill_cubit.dart';

enum BillStatus {
  initial,
  loading,
  success,
  failure,
}

class BillState extends Equatable {
  final BillStatus status;
  final int numOfBill;
  final List<Bill> bills;
  final List<String> selectedRows;
  const BillState({
    this.status = BillStatus.initial,
    required this.bills,
    this.numOfBill = 0,
    required this.selectedRows,
  });
  BillState copyWith(
      {BillStatus? status,
      List<Bill>? bills,
      int? numOfBill,
      List<String>? selectedRows}) {
    return BillState(
      status: status ?? this.status,
      bills: bills ?? this.bills,
      numOfBill: numOfBill ?? this.numOfBill,
      selectedRows: selectedRows ?? this.selectedRows,
    );
  }

  @override
  List<Object?> get props => [status, bills, numOfBill, selectedRows];
}
