part of 'transfer_cubit.dart';

enum TransferStatus {
  initial,
  loading,
  success,
  failure,
  invalid,
  inputing,
}

class TransferState extends Equatable {
  final TransferStatus status;
  final num? transferValueInt;
  final String? transferValueString;
  final bool transferStatus;
  final TransferWalletResponse? transferRes;
  const TransferState({
    this.status = TransferStatus.initial,
    this.transferValueInt = 0,
    this.transferValueString = "0",
    this.transferStatus = false,
    this.transferRes,
  });

  TransferState copyWith({
    TransferStatus? status,
    int? transferValueInt,
    String? transferValueString,
    bool? transferStatus,
    TransferWalletResponse? transferRes,
  }) {
    return TransferState(
      status: status ?? this.status,
      transferValueInt: transferValueInt ?? this.transferValueInt,
      transferValueString: transferValueString ?? this.transferValueString,
      transferStatus: transferStatus ?? this.transferStatus,
      transferRes: transferRes,
    );
  }

  @override
  List<Object?> get props => [
        status,
        transferValueInt,
        transferValueString,
        transferStatus,
        transferRes
      ];
}
