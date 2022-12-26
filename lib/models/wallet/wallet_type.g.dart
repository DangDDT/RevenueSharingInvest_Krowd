// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletType _$WalletTypeFromJson(Map<String, dynamic> json) => WalletType(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      mode: json['mode'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$WalletTypeToJson(WalletType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'mode': instance.mode,
      'type': instance.type,
    };
