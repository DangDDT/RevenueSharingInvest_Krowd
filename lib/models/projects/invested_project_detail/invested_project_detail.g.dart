// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invested_project_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvestedProjectDetail _$InvestedProjectDetailFromJson(
        Map<String, dynamic> json) =>
    InvestedProjectDetail(
      mustPaidDept: json['mustPaidDept'] as num?,
      profitableDebt: json['profitableDebt'] as num?,
      latestPayment: json['latestPayment'] as String?,
      investmentRecords: (json['investmentRecords'] as List<dynamic>?)
          ?.map((e) => InvestmentRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
      projectImage: json['projectImage'] as String?,
      projectName: json['projectName'] as String?,
      projectStatus: json['projectStatus'] as String?,
      expectedReturn: json['expectedReturn'] as num?,
      returnedAmount: json['returnedAmount'] as num?,
      deptRemain: json['deptRemain'] as num?,
      investedAmount: json['investedAmount'] as num?,
      numOfStage: json['numOfStage'] as num?,
      numOfPayedStage: json['numOfPayedStage'] as num?,
    );

Map<String, dynamic> _$InvestedProjectDetailToJson(
        InvestedProjectDetail instance) =>
    <String, dynamic>{
      'mustPaidDept': instance.mustPaidDept,
      'profitableDebt': instance.profitableDebt,
      'latestPayment': instance.latestPayment,
      'investmentRecords': instance.investmentRecords,
      'projectImage': instance.projectImage,
      'projectName': instance.projectName,
      'projectStatus': instance.projectStatus,
      'expectedReturn': instance.expectedReturn,
      'returnedAmount': instance.returnedAmount,
      'deptRemain': instance.deptRemain,
      'investedAmount': instance.investedAmount,
      'numOfStage': instance.numOfStage,
      'numOfPayedStage': instance.numOfPayedStage,
    };
