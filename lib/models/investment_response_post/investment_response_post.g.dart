// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investment_response_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvestmentResponsePost _$InvestmentResponsePostFromJson(
        Map<String, dynamic> json) =>
    InvestmentResponsePost(
      projectId: json['projectId'] as String?,
      projectName: json['projectName'] as String?,
      packageId: json['packageId'] as String?,
      packageName: json['packageName'] as String?,
      investedQuantity: json['investedQuantity'] as num?,
      fromWalletName: json['fromWalletName'] as String?,
      fee: json['fee'] as String?,
      id: json['id'] as String?,
      periodRevenueId: json['periodRevenueId'],
      investmentId: json['investmentId'] as String?,
      amount: json['amount'] as num?,
      description: json['description'] as String?,
      type: json['type'] as String?,
      fromId: json['fromId'] as String?,
      toId: json['toId'] as String?,
      createDate: json['createDate'] as String?,
      createBy: json['createBy'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$InvestmentResponsePostToJson(
        InvestmentResponsePost instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'projectName': instance.projectName,
      'packageId': instance.packageId,
      'packageName': instance.packageName,
      'investedQuantity': instance.investedQuantity,
      'fromWalletName': instance.fromWalletName,
      'fee': instance.fee,
      'id': instance.id,
      'periodRevenueId': instance.periodRevenueId,
      'investmentId': instance.investmentId,
      'amount': instance.amount,
      'description': instance.description,
      'type': instance.type,
      'fromId': instance.fromId,
      'toId': instance.toId,
      'createDate': instance.createDate,
      'createBy': instance.createBy,
      'status': instance.status,
    };
