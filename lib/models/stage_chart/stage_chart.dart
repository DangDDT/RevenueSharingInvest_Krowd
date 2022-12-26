import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'line_list.dart';

part 'stage_chart.g.dart';

@JsonSerializable()
class StageChart extends Equatable {
  final String? chartName;
  final List<Line>? lineList;

  StageChart({this.chartName, this.lineList});

  factory StageChart.fromJson(Map<String, dynamic> json) =>
      _$StageChartFromJson(json);

  Map<String, dynamic> toJson() => _$StageChartToJson(this);
  StageChart copyWith({String? chartName, List<Line>? lineList}) {
    return StageChart(
      chartName: chartName ?? this.chartName,
      lineList: lineList ?? this.lineList,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      chartName,
      lineList,
    ];
  }
}
