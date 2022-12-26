part of 'withdraw_request_cubit.dart';

enum WithdrawRequestStatus {
  initial,
  loading,
  success,
  failure,
}

enum WRStatus {
  PENDING,
  PARTIAL,
  APPROVED,
  REJECTED,
  PARTIAL_ADMIN,
}

class WithdrawRequestState extends Equatable {
  final WithdrawRequestStatus status;
  final WithdrawRequestPost? req;
  final WithdrawResponse? res;
  final List<WithdrawRequest> withdrawRequests;
  final WRStatus currentStatusFilter;
  final int? currentStatusFilterInt;
  final num numOfWithdrawRequest;
  final String report;
  const WithdrawRequestState({
    this.status = WithdrawRequestStatus.initial,
    this.req,
    this.res,
    required this.withdrawRequests,
    this.currentStatusFilter = WRStatus.PENDING,
    this.currentStatusFilterInt,
    this.numOfWithdrawRequest = 0,
    this.report = "Không nhận được tiền",
  });
  WithdrawRequestState copyWith({
    WithdrawRequestStatus? status,
    WithdrawRequestPost? req,
    WithdrawResponse? res,
    List<WithdrawRequest>? withdrawRequests,
    WRStatus? currentStatusFilter,
    int? currentStatusFilterInt,
    num? numOfWithdrawRequest,
    String? report,
  }) {
    return WithdrawRequestState(
        status: status ?? this.status,
        req: req ?? this.req,
        res: res ?? this.res,
        withdrawRequests: withdrawRequests ?? this.withdrawRequests,
        currentStatusFilter: currentStatusFilter ?? this.currentStatusFilter,
        currentStatusFilterInt:
            currentStatusFilterInt ?? this.currentStatusFilterInt,
        numOfWithdrawRequest: numOfWithdrawRequest ?? this.numOfWithdrawRequest,
        report: report ?? this.report);
  }

  @override
  List<Object?> get props => [
        status,
        req,
        res,
        withdrawRequests,
        currentStatusFilter,
        currentStatusFilterInt,
        numOfWithdrawRequest,
        report,
      ];
}
