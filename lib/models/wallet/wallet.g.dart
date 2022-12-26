// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wallet _$WalletFromJson(Map<String, dynamic> json) => Wallet(
      walletType: json['walletType'] == null
          ? null
          : WalletType.fromJson(json['walletType'] as Map<String, dynamic>),
      id: json['id'] as String,
      investorId: json['investorId'] as String?,
      balance: (json['balance'] as num?)?.toDouble(),
      createDate: json['createDate'] as String?,
      createBy: json['createBy'] as String?,
      updateDate: json['updateDate'] as String?,
      updateBy: json['updateBy'] as String?,
      isDeleted: json['isDeleted'] as bool?,
    );

Map<String, dynamic> _$WalletToJson(Wallet instance) => <String, dynamic>{
      'walletType': instance.walletType,
      'id': instance.id,
      'investorId': instance.investorId,
      'balance': instance.balance,
      'createDate': instance.createDate,
      'createBy': instance.createBy,
      'updateDate': instance.updateDate,
      'updateBy': instance.updateBy,
      'isDeleted': instance.isDeleted,
    };
