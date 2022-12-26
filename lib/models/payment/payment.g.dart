// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payment _$PaymentFromJson(Map<String, dynamic> json) => Payment(
      projectId: json['projectId'] as String?,
      projectName: json['projectName'] as String?,
      stageId: json['stageId'] as String?,
      stageName: json['stageName'] as String?,
      fromWalletName: json['fromWalletName'] as String?,
      fee: json['fee'] as num?,
      id: json['id'] as String?,
      periodRevenueId: json['periodRevenueId'] as String?,
      investmentId: json['investmentId'] as String?,
      amount: json['amount'] as num,
      description: json['description'] as String?,
      type: json['type'] as String?,
      fromId: json['fromId'] as String?,
      toId: json['toId'] as String?,
      createDate: json['createDate'] as String?,
      createBy: json['createBy'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
      'projectId': instance.projectId,
      'projectName': instance.projectName,
      'stageId': instance.stageId,
      'stageName': instance.stageName,
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
