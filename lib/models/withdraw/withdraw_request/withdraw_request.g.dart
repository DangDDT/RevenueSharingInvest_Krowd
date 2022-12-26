// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdraw_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WithdrawRequest _$WithdrawRequestFromJson(Map<String, dynamic> json) =>
    WithdrawRequest(
      id: json['id'] as String,
      bankName: json['bankName'] as String,
      accountName: json['accountName'] as String,
      bankAccount: json['bankAccount'] as String,
      description: json['description'] as String,
      amount: json['amount'] as num,
      status: json['status'] as String,
      refusalReason: json['refusalReason'],
      createDate: json['createDate'] as String?,
      createBy: json['createBy'] as String?,
      updateDate: json['updateDate'] as String?,
      updateBy: json['updateBy'] as String?,
      fromWalletId: json['fromWalletId'] as String?,
      fromWalletName: json['fromWalletName'] as String?,
      reportMessage: json['reportMessage'] as String?,
    );

Map<String, dynamic> _$WithdrawRequestToJson(WithdrawRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bankName': instance.bankName,
      'accountName': instance.accountName,
      'bankAccount': instance.bankAccount,
      'description': instance.description,
      'amount': instance.amount,
      'status': instance.status,
      'refusalReason': instance.refusalReason,
      'createDate': instance.createDate,
      'createBy': instance.createBy,
      'updateDate': instance.updateDate,
      'updateBy': instance.updateBy,
      'fromWalletId': instance.fromWalletId,
      'fromWalletName': instance.fromWalletName,
      'reportMessage': instance.reportMessage,
    };
