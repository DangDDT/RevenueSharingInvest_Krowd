part of 'investment_cubit.dart';

enum InvestmentStatus {
  initial,
  loading,
  success,
  failure,
}

class InvestmentState extends Equatable {
  final InvestmentStatus status;
  final InvestmentRequestPost? req;
  final InvestmentResponsePost? res;
  final num numOfInvestment;
  final List<Investment> investments;
  final Investment? canceledInvestment;
  final bool cancelInvestmentStatus;
  const InvestmentState({
    this.status = InvestmentStatus.initial,
    this.req,
    this.res,
    required this.investments,
    this.numOfInvestment = 0,
    this.canceledInvestment,
    this.cancelInvestmentStatus = false,
  });
  InvestmentState copyWith({
    InvestmentStatus? status,
    InvestmentRequestPost? req,
    InvestmentResponsePost? res,
    List<Investment>? investments,
    num? numOfInvestment,
    Investment? canceledInvestment,
    bool? cancelInvestmentStatus,
  }) {
    return InvestmentState(
        status: status ?? this.status,
        req: req ?? this.req,
        res: res ?? this.res,
        numOfInvestment: numOfInvestment ?? this.numOfInvestment,
        investments: investments ?? this.investments,
        canceledInvestment: canceledInvestment ?? this.canceledInvestment,
        cancelInvestmentStatus:
            cancelInvestmentStatus ?? this.cancelInvestmentStatus);
  }

  @override
  List<Object?> get props => [
        status,
        res,
        res,
        numOfInvestment,
        investments,
        canceledInvestment,
        cancelInvestmentStatus
      ];
}
