// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyReport _$DailyReportFromJson(Map<String, dynamic> json) => DailyReport(
      id: json['id'] as String?,
      stageId: json['stageId'] as String?,
      amount: (json['amount'] as num).toDouble(),
      reportDate: json['reportDate'] as String?,
      createDate: json['createDate'] as String?,
      createBy: json['createBy'] as String?,
      updateDate: json['updateDate'],
      updateBy: json['updateBy'],
      status: json['status'] as String?,
    );

Map<String, dynamic> _$DailyReportToJson(DailyReport instance) =>
    <String, dynamic>{
      'id': instance.id,
      'stageId': instance.stageId,
      'amount': instance.amount,
      'reportDate': instance.reportDate,
      'createDate': instance.createDate,
      'createBy': instance.createBy,
      'updateDate': instance.updateDate,
      'updateBy': instance.updateBy,
      'status': instance.status,
    };
