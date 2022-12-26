part of 'report_revenue_cubit.dart';

enum ReportRevenueStatus {
  prepareInit,
  initial,
  loading,
  success,
  failure,
}

const Map<String, List<dynamic>> renderReportStatus = {
  "UNDUE": [
    "Chưa đến hạn",
    "Undue",
    nGray5,
  ],
  "DUE": [
    "Chờ báo cáo",
    "Undue",
    bOrange,
  ],
  "REPORTED": [
    "Đã báo cáo",
    "Reported",
    bGreen,
  ],
  "NOT_REPORTED": [
    "Chưa báo cáo",
    "Reported",
    bRed,
  ],
};

class ReportRevenueState extends Equatable {
  final ReportRevenueStatus status;
  final String? projectId;
  final List<Stage> stages;
  final Stage? selectedStage;
  final List<DailyReport> dailyReports;
  const ReportRevenueState({
    this.status = ReportRevenueStatus.initial,
    this.projectId,
    required this.stages,
    this.selectedStage,
    required this.dailyReports,
  });
  ReportRevenueState copyWith(
      {ReportRevenueStatus? status,
      List<Stage>? stages,
      Stage? selectedStage,
      String? projectId,
      List<DailyReport>? dailyReports}) {
    return ReportRevenueState(
      status: status ?? this.status,
      projectId: projectId ?? this.projectId,
      stages: stages ?? this.stages,
      selectedStage: selectedStage ?? this.selectedStage,
      dailyReports: dailyReports ?? this.dailyReports,
    );
  }

  @override
  List<Object?> get props =>
      [status, projectId, stages, selectedStage, dailyReports];
}
