// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletTransaction _$WalletTransactionFromJson(Map<String, dynamic> json) =>
    WalletTransaction(
      id: json['id'] as String?,
      userId: json['userId'],
      paymentId: json['paymentId'] as String?,
      systemWalletId: json['systemWalletId'],
      projectWalletId: json['projectWalletId'],
      investorWalletId: json['investorWalletId'],
      amount: (json['amount'] as num?)?.toDouble(),
      description: json['description'] as String?,
      type: json['type'] as String?,
      fromWalletId: json['fromWalletId'] as String?,
      toWalletId: json['toWalletId'] as String?,
      fee: (json['fee'] as num?)?.toDouble(),
      createDate: json['createDate'] as String?,
      createBy: json['createBy'] as String?,
    );

Map<String, dynamic> _$WalletTransactionToJson(WalletTransaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'paymentId': instance.paymentId,
      'systemWalletId': instance.systemWalletId,
      'projectWalletId': instance.projectWalletId,
      'investorWalletId': instance.investorWalletId,
      'amount': instance.amount,
      'description': instance.description,
      'type': instance.type,
      'fromWalletId': instance.fromWalletId,
      'toWalletId': instance.toWalletId,
      'fee': instance.fee,
      'createDate': instance.createDate,
      'createBy': instance.createBy,
    };
