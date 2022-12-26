// ignore_for_file: non_constant_identifier_names

import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quiver/iterables.dart';
import 'package:rsi/models/models.dart';
import 'package:rsi/resources/repository.dart';

part 'stage_state.dart';

class StageCubit extends Cubit<StageState> {
  final Repository repository = new Repository();
  StageCubit()
      : super(StageState(
            listFilter: ["Tất cả"],
            listFilterInt: [],
            currentTab: StageTab.CARD));
  void init(String projectId) {
    emit(state.copyWith(projectId: projectId));
  }

  Future<void> fetchStageByProjectId(String projectId) async {
    emit(state.copyWith(
      status: StageStatus.loading,
    ));
    try {
      final tuple2_numOfProject_listOfStage =
          await repository.fetchStageByProjectId(projectId);

      final numOfStage = tuple2_numOfProject_listOfStage.item1 ?? 0;
      final stageList = tuple2_numOfProject_listOfStage.item2;
      final numOfChoiceFilter = sqrt(numOfStage).ceil();
      final sequenceNumbers = new List<int>.generate(numOfStage, (k) => k + 1);
      final chunkSize = (numOfStage / numOfChoiceFilter).floor();
      final listFilterIntGenerated =
          partition(sequenceNumbers, chunkSize).toList();
      final List<String> listFilterGenerated = listFilterIntGenerated.map((e) {
        if (e.length > 1)
          return "Kỳ ${e[0]} - Kỳ ${e[e.length - 1]}";
        else
          return "Kỳ ${e[0]}";
      }).toList();
      final List<String> listFilter = ["Tất cả", ...listFilterGenerated];
      final listFilterInt = [sequenceNumbers, ...listFilterIntGenerated];
      final filteredStages = sequenceNumbers
          .map((value) => stageList!.elementAt(value - 1))
          .toList();
      emit(state.copyWith(
        status: StageStatus.success,
        numOfStage: numOfStage,
        stages: stageList,
        listFilter: listFilter,
        listFilterInt: listFilterInt,
        filteredStages: filteredStages,
      ));
    } catch (e) {
      emit(state.copyWith(status: StageStatus.failure));
    }
  }

  Future<void> onChangeCurrentTab(int tabIndex) async {
    switch (tabIndex) {
      case 0:
        emit(state.copyWith(currentTab: StageTab.CARD));
        break;
      case 1:
        emit(state.copyWith(
            status: StageStatus.loading, currentTab: StageTab.CHART));
        try {
          final stageCharts =
              await repository.fetchStageChartByProjectId(state.projectId!);
          emit(state.copyWith(
              status: StageStatus.success, stageCharts: stageCharts));
        } catch (e) {
          emit(state.copyWith(status: StageStatus.failure));
        }
        break;
      default:
        emit(state.copyWith(currentTab: StageTab.CARD));
    }
  }

  void onUseFilterStage(List<int> selectedFilter) {
    final filteredStages = selectedFilter
        .map((value) => state.stages!.elementAt(value - 1))
        .toList();
    emit(state.copyWith(
        selectedFilter: selectedFilter, filteredStages: filteredStages));
  }
}
