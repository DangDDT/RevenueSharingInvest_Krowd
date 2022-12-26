part of 'stage_cubit.dart';

enum StageStatus {
  initial,
  loading,
  success,
  failure,
}

enum StageTab { CARD, CHART }

class StageState extends Equatable {
  final StageStatus status;
  final String? projectId;
  final StageTab currentTab;
  final List<int>? selectedFilter;
  final int? numOfStage;
  final List<Stage>? stages;
  final List<String> listFilter;
  final List<List<int>> listFilterInt;
  final List<Stage>? filteredStages;
  final List<StageChart>? stageCharts;

  const StageState(
      {this.status = StageStatus.initial,
      this.currentTab = StageTab.CARD,
      this.selectedFilter,
      this.numOfStage,
      this.stages,
      required this.listFilter,
      required this.listFilterInt,
      this.filteredStages,
      this.stageCharts,
      this.projectId});
  StageState copyWith({
    StageStatus? status,
    StageTab? currentTab,
    List<int>? selectedFilter,
    int? numOfStage,
    List<Stage>? stages,
    List<String>? listFilter,
    List<List<int>>? listFilterInt,
    List<Stage>? filteredStages,
    List<StageChart>? stageCharts,
    String? projectId,
  }) {
    return StageState(
      status: status ?? this.status,
      currentTab: currentTab ?? this.currentTab,
      selectedFilter: selectedFilter ?? this.selectedFilter,
      numOfStage: numOfStage ?? this.numOfStage,
      stages: stages ?? this.stages,
      listFilter: listFilter ?? this.listFilter,
      listFilterInt: listFilterInt ?? this.listFilterInt,
      filteredStages: filteredStages ?? this.filteredStages,
      stageCharts: stageCharts ?? this.stageCharts,
      projectId: this.projectId ?? this.projectId,
    );
  }

  @override
  List<Object?> get props => [
        status,
        currentTab,
        selectedFilter,
        numOfStage,
        stages,
        listFilter,
        listFilterInt,
        filteredStages,
        stageCharts
      ];
}
