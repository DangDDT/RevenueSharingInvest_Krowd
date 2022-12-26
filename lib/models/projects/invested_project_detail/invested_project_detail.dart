import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'investment_record.dart';

part 'invested_project_detail.g.dart';

@JsonSerializable()
class InvestedProjectDetail extends Equatable {
  final num? mustPaidDept;
  final num? profitableDebt;
  final String? latestPayment;
  final List<InvestmentRecord>? investmentRecords;
  final String? projectImage;
  final String? projectName;
  final String? projectStatus;
  final num? expectedReturn;
  final num? returnedAmount;
  final num? deptRemain;
  final num? investedAmount;
  final num? numOfStage;
  final num? numOfPayedStage;

  const InvestedProjectDetail({
    this.mustPaidDept,
    this.profitableDebt,
    this.latestPayment,
    this.investmentRecords,
    this.projectImage,
    this.projectName,
    this.projectStatus,
    this.expectedReturn,
    this.returnedAmount,
    this.deptRemain,
    this.investedAmount,
    this.numOfStage,
    this.numOfPayedStage,
  });

  factory InvestedProjectDetail.fromJson(Map<String, dynamic> json) {
    return _$InvestedProjectDetailFromJson(json);
  }

  Map<String, dynamic> toJson() => _$InvestedProjectDetailToJson(this);

  InvestedProjectDetail copyWith({
    num? mustPaidDept,
    num? profitableDebt,
    String? latestPayment,
    List<InvestmentRecord>? investmentRecords,
    String? projectImage,
    String? projectName,
    String? projectStatus,
    num? expectedReturn,
    num? returnedAmount,
    num? deptRemain,
    num? investedAmount,
    num? numOfStage,
    num? numOfPayedStage,
  }) {
    return InvestedProjectDetail(
      mustPaidDept: mustPaidDept ?? this.mustPaidDept,
      profitableDebt: profitableDebt ?? this.profitableDebt,
      latestPayment: latestPayment ?? this.latestPayment,
      investmentRecords: investmentRecords ?? this.investmentRecords,
      projectImage: projectImage ?? this.projectImage,
      projectName: projectName ?? this.projectName,
      projectStatus: projectStatus ?? this.projectStatus,
      expectedReturn: expectedReturn ?? this.expectedReturn,
      returnedAmount: returnedAmount ?? this.returnedAmount,
      deptRemain: deptRemain ?? this.deptRemain,
      investedAmount: investedAmount ?? this.investedAmount,
      numOfStage: numOfStage ?? this.numOfStage,
      numOfPayedStage: numOfPayedStage ?? this.numOfPayedStage,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      mustPaidDept,
      profitableDebt,
      latestPayment,
      investmentRecords,
      projectImage,
      projectName,
      projectStatus,
      expectedReturn,
      returnedAmount,
      deptRemain,
      investedAmount,
      numOfStage,
      numOfPayedStage,
    ];
  }
}
