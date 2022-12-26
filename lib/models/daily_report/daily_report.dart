import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'daily_report.g.dart';

@JsonSerializable()
class DailyReport extends Equatable {
  final String? id;
  final String? stageId;
  final double amount;
  final String? reportDate;
  final String? createDate;
  final String? createBy;
  final dynamic updateDate;
  final dynamic updateBy;
  final String? status;

  const DailyReport({
    this.id,
    this.stageId,
    required this.amount,
    this.reportDate,
    this.createDate,
    this.createBy,
    this.updateDate,
    this.updateBy,
    this.status,
  });

  factory DailyReport.fromJson(Map<String, dynamic> json) {
    return _$DailyReportFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DailyReportToJson(this);

  DailyReport copyWith({
    String? id,
    String? stageId,
    double? amount,
    String? reportDate,
    String? createDate,
    String? createBy,
    dynamic updateDate,
    dynamic updateBy,
    String? status,
  }) {
    return DailyReport(
      id: id ?? this.id,
      stageId: stageId ?? this.stageId,
      amount: amount ?? this.amount,
      reportDate: reportDate ?? this.reportDate,
      createDate: createDate ?? this.createDate,
      createBy: createBy ?? this.createBy,
      updateDate: updateDate ?? this.updateDate,
      updateBy: updateBy ?? this.updateBy,
      status: status ?? this.status,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      stageId,
      amount,
      reportDate,
      createDate,
      createBy,
      updateDate,
      updateBy,
      status,
    ];
  }
}
