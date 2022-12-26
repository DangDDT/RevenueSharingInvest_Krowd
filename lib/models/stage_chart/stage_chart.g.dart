// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stage_chart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StageChart _$StageChartFromJson(Map<String, dynamic> json) => StageChart(
      chartName: json['chartName'] as String?,
      lineList: (json['lineList'] as List<dynamic>?)
          ?.map((e) => Line.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StageChartToJson(StageChart instance) =>
    <String, dynamic>{
      'chartName': instance.chartName,
      'lineList': instance.lineList,
    };
