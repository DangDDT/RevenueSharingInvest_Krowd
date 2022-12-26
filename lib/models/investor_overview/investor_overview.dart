import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'investor_overview.g.dart';

@JsonSerializable()
class InvestorOverview extends Equatable {
  final num totalDepositedAmount;
  final num totalWithdrawedAmount;
  final num totalInvestedAmount;
  final num totalReceivedAmount;
  final num numOfInvestedProject;
  final num numOfCallingForInvestmentInvestedProject;
  final num numOfActiveInvestedProject;
  final num numOfCallingTimeIsOverInvestedProject;
  final num numOfInvestment;
  final num numOfSuccessInvestment;
  final num numOfFailedInvestment;
  final num numOfCanceledInvestment;

  const InvestorOverview({
    this.totalDepositedAmount = 0,
    this.totalWithdrawedAmount = 0,
    this.totalInvestedAmount = 0,
    this.totalReceivedAmount = 0,
    this.numOfInvestedProject = 0,
    this.numOfCallingForInvestmentInvestedProject = 0,
    this.numOfActiveInvestedProject = 0,
    this.numOfCallingTimeIsOverInvestedProject = 0,
    this.numOfInvestment = 0,
    this.numOfSuccessInvestment = 0,
    this.numOfFailedInvestment = 0,
    this.numOfCanceledInvestment = 0,
  });

  factory InvestorOverview.fromJson(Map<String, dynamic> json) {
    return _$InvestorOverviewFromJson(json);
  }

  Map<String, dynamic> toJson() => _$InvestorOverviewToJson(this);

  InvestorOverview copyWith({
    num? totalDepositedAmount,
    num? totalWithdrawedAmount,
    num? totalInvestedAmount,
    num? totalReceivedAmount,
    num? numOfInvestedProject,
    num? numOfCallingForInvestmentInvestedProject,
    num? numOfActiveInvestedProject,
    num? numOfCallingTimeIsOverInvestedProject,
    num? numOfInvestment,
    num? numOfSuccessInvestment,
    num? numOfFailedInvestment,
    num? numOfCanceledInvestment,
  }) {
    return InvestorOverview(
      totalDepositedAmount: totalDepositedAmount ?? this.totalDepositedAmount,
      totalWithdrawedAmount:
          totalWithdrawedAmount ?? this.totalWithdrawedAmount,
      totalInvestedAmount: totalInvestedAmount ?? this.totalInvestedAmount,
      totalReceivedAmount: totalReceivedAmount ?? this.totalReceivedAmount,
      numOfInvestedProject: numOfInvestedProject ?? this.numOfInvestedProject,
      numOfCallingForInvestmentInvestedProject:
          numOfCallingForInvestmentInvestedProject ??
              this.numOfCallingForInvestmentInvestedProject,
      numOfActiveInvestedProject:
          numOfActiveInvestedProject ?? this.numOfActiveInvestedProject,
      numOfInvestment: numOfInvestment ?? this.numOfInvestment,
      numOfSuccessInvestment:
          numOfSuccessInvestment ?? this.numOfSuccessInvestment,
      numOfFailedInvestment:
          numOfFailedInvestment ?? this.numOfFailedInvestment,
      numOfCanceledInvestment:
          numOfCanceledInvestment ?? this.numOfCanceledInvestment,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      totalDepositedAmount,
      totalWithdrawedAmount,
      totalInvestedAmount,
      totalReceivedAmount,
      numOfInvestedProject,
      numOfCallingForInvestmentInvestedProject,
      numOfActiveInvestedProject,
      numOfInvestment,
      numOfSuccessInvestment,
      numOfFailedInvestment,
      numOfCanceledInvestment,
    ];
  }
}
