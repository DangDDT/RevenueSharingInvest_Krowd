// ignore_for_file: non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/models/models.dart';
import 'package:rsi/resources/repository.dart';

part 'report_revenue_state.dart';

class ReportRevenueCubit extends Cubit<ReportRevenueState> {
  final Repository repository = new Repository();
  ReportRevenueCubit()
      : super(const ReportRevenueState(stages: [], dailyReports: []));

  Future<void> init({required String projectId}) async {
    emit(state.copyWith(status: ReportRevenueStatus.prepareInit));
    try {
      final tuple2_numOfStage_stages =
          await repository.fetchStageByProjectId(projectId);
      final stages = tuple2_numOfStage_stages.item2;
      emit(
        state.copyWith(
          stages: stages,
          status: ReportRevenueStatus.initial,
          selectedStage: stages!.elementAt(0),
          projectId: projectId,
        ),
      );
      fetchDailyReport();
    } catch (e) {
      emit(state.copyWith(status: ReportRevenueStatus.prepareInit));
    }
  }

  onStageChange(String newStageName) {
    final newStage = state.stages.firstWhere((e) => e.name == newStageName);
    emit(state.copyWith(selectedStage: newStage));
    fetchDailyReport();
  }

  Future<void> fetchDailyReport() async {
    emit(state.copyWith(status: ReportRevenueStatus.loading));
    try {
      final tuple2_numOfDailyReport_listOfDailyReport =
          await repository.fetchDailyReport(
              projectId: state.projectId!, stageId: state.selectedStage!.id);
      final listOfDailyReport = tuple2_numOfDailyReport_listOfDailyReport.item2;
      emit(state.copyWith(
          status: ReportRevenueStatus.success,
          dailyReports: listOfDailyReport));
    } catch (e) {
      emit(state.copyWith(status: ReportRevenueStatus.failure));
    }
  }
}
