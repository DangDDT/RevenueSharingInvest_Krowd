// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_wallet_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferWalletResponse _$TransferWalletResponseFromJson(
        Map<String, dynamic> json) =>
    TransferWalletResponse(
      fromWalletId: json['fromWalletId'] as String?,
      fromWalletName: json['fromWalletName'] as String?,
      fromWalletType: json['fromWalletType'] as String?,
      toWalletId: json['toWalletId'] as String?,
      toWalletName: json['toWalletName'] as String?,
      toWalletType: json['toWalletType'] as String?,
      amount: json['amount'] as num?,
    );

Map<String, dynamic> _$TransferWalletResponseToJson(
        TransferWalletResponse instance) =>
    <String, dynamic>{
      'fromWalletId': instance.fromWalletId,
      'fromWalletName': instance.fromWalletName,
      'fromWalletType': instance.fromWalletType,
      'toWalletId': instance.toWalletId,
      'toWalletName': instance.toWalletName,
      'toWalletType': instance.toWalletType,
      'amount': instance.amount,
    };
