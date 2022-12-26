part of 'fetch_project_detail_cubit.dart';

enum FetchProjectDetailStatus {
  initial,
  loading,
  success,
  failure,
}

class FetchProjectDetailState extends Equatable {
  final FetchProjectDetailStatus status;
  final ProjectDetail? projectDetailById;
  final List<String?>? pitchIds;
  final bool isHasPullRequestEvent;
  final TypeItemList? currentPitch;
  const FetchProjectDetailState({
    this.status = FetchProjectDetailStatus.initial,
    this.projectDetailById,
    this.pitchIds,
    this.isHasPullRequestEvent = false,
    this.currentPitch,
  });
  FetchProjectDetailState copyWith({
    FetchProjectDetailStatus? status,
    ProjectDetail? projectDetailById,
    List<String?>? pitchIds,
    bool? isHasPullRequestEvent,
    TypeItemList? currentPitch,
  }) {
    return FetchProjectDetailState(
      status: status ?? this.status,
      projectDetailById: projectDetailById ?? this.projectDetailById,
      pitchIds: pitchIds ?? this.pitchIds,
      isHasPullRequestEvent:
          isHasPullRequestEvent ?? this.isHasPullRequestEvent,
      currentPitch: currentPitch ?? this.currentPitch,
    );
  }

  @override
  List<Object?> get props => [
        status,
        projectDetailById,
        pitchIds,
        isHasPullRequestEvent,
        currentPitch
      ];
}
