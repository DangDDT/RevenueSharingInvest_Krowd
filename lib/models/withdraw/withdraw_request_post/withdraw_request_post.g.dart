// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdraw_request_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WithdrawRequestPost _$WithdrawRequestPostFromJson(Map<String, dynamic> json) =>
    WithdrawRequestPost(
      fromWalletId: json['fromWalletId'] as String,
      bankName: json['bankName'] as String,
      accountName: json['accountName'] as String,
      bankAccount: json['bankAccount'] as String,
      amount: json['amount'] as num,
    );

Map<String, dynamic> _$WithdrawRequestPostToJson(
        WithdrawRequestPost instance) =>
    <String, dynamic>{
      'fromWalletId': instance.fromWalletId,
      'bankName': instance.bankName,
      'accountName': instance.accountName,
      'bankAccount': instance.bankAccount,
      'amount': instance.amount,
    };
