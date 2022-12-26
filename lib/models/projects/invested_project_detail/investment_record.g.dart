// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investment_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvestmentRecord _$InvestmentRecordFromJson(Map<String, dynamic> json) =>
    InvestmentRecord(
      packageName: json['packageName'] as String?,
      quantity: json['quantity'] as num?,
      totalPrice: json['totalPrice'] as num?,
      createDate: json['createDate'] as String?,
    );

Map<String, dynamic> _$InvestmentRecordToJson(InvestmentRecord instance) =>
    <String, dynamic>{
      'packageName': instance.packageName,
      'quantity': instance.quantity,
      'totalPrice': instance.totalPrice,
      'createDate': instance.createDate,
    };
