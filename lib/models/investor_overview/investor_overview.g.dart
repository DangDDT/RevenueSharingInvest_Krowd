// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investor_overview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvestorOverview _$InvestorOverviewFromJson(Map<String, dynamic> json) =>
    InvestorOverview(
      totalDepositedAmount: json['totalDepositedAmount'] as num? ?? 0,
      totalWithdrawedAmount: json['totalWithdrawedAmount'] as num? ?? 0,
      totalInvestedAmount: json['totalInvestedAmount'] as num? ?? 0,
      totalReceivedAmount: json['totalReceivedAmount'] as num? ?? 0,
      numOfInvestedProject: json['numOfInvestedProject'] as num? ?? 0,
      numOfCallingForInvestmentInvestedProject:
          json['numOfCallingForInvestmentInvestedProject'] as num? ?? 0,
      numOfActiveInvestedProject:
          json['numOfActiveInvestedProject'] as num? ?? 0,
      numOfCallingTimeIsOverInvestedProject:
          json['numOfCallingTimeIsOverInvestedProject'] as num? ?? 0,
      numOfInvestment: json['numOfInvestment'] as num? ?? 0,
      numOfSuccessInvestment: json['numOfSuccessInvestment'] as num? ?? 0,
      numOfFailedInvestment: json['numOfFailedInvestment'] as num? ?? 0,
      numOfCanceledInvestment: json['numOfCanceledInvestment'] as num? ?? 0,
    );

Map<String, dynamic> _$InvestorOverviewToJson(InvestorOverview instance) =>
    <String, dynamic>{
      'totalDepositedAmount': instance.totalDepositedAmount,
      'totalWithdrawedAmount': instance.totalWithdrawedAmount,
      'totalInvestedAmount': instance.totalInvestedAmount,
      'totalReceivedAmount': instance.totalReceivedAmount,
      'numOfInvestedProject': instance.numOfInvestedProject,
      'numOfCallingForInvestmentInvestedProject':
          instance.numOfCallingForInvestmentInvestedProject,
      'numOfActiveInvestedProject': instance.numOfActiveInvestedProject,
      'numOfCallingTimeIsOverInvestedProject':
          instance.numOfCallingTimeIsOverInvestedProject,
      'numOfInvestment': instance.numOfInvestment,
      'numOfSuccessInvestment': instance.numOfSuccessInvestment,
      'numOfFailedInvestment': instance.numOfFailedInvestment,
      'numOfCanceledInvestment': instance.numOfCanceledInvestment,
    };
