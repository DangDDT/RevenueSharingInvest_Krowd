// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bill _$BillFromJson(Map<String, dynamic> json) => Bill(
      id: json['id'] as String?,
      dailyReportId: json['dailyReportId'] as String?,
      invoiceId: json['invoiceId'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      description: json['description'] as String?,
      createBy: json['createBy'] as String?,
      createDate: json['createDate'] as String?,
    );

Map<String, dynamic> _$BillToJson(Bill instance) => <String, dynamic>{
      'id': instance.id,
      'dailyReportId': instance.dailyReportId,
      'invoiceId': instance.invoiceId,
      'amount': instance.amount,
      'description': instance.description,
      'createBy': instance.createBy,
      'createDate': instance.createDate,
    };
