import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rsi/models/models.dart';
import 'package:rsi/resources/repository.dart';

part 'fetch_project_detail_state.dart';

class FetchProjectDetailCubit extends Cubit<FetchProjectDetailState> {
  final Repository repository = new Repository();
  FetchProjectDetailCubit() : super(const FetchProjectDetailState());
  init() {
    emit(FetchProjectDetailState());
  }

  Future<void> fetchProjectDetail(String id) async {
    emit(state.copyWith(status: FetchProjectDetailStatus.loading));
    try {
      final ProjectDetail? projectDetailById =
          await repository.fetchProjectById(id);
      List<String?> pitchIds = List<String>.empty();
      if (projectDetailById != null) {
        final projectEntity = projectDetailById.projectEntity!;
        final pitchs = projectEntity
            .firstWhere((value) => value.type == "PITCH")
            .typeItemList;
        if (pitchs != null)
          pitchIds = pitchs.map((_pitch) => _pitch.id).toList();
      }
      emit(
        state.copyWith(
          status: FetchProjectDetailStatus.success,
          projectDetailById: projectDetailById,
          pitchIds: pitchIds,
        ),
      );
      fetchPitch(pitchIds.elementAt(0)!);
    } catch (e) {
      emit(state.copyWith(status: FetchProjectDetailStatus.failure));
    }
  }

  void fetchPitch(String pitchId) {
    final currentPitch = state.projectDetailById!.projectEntity!
        .firstWhere((value) => value.type == "PITCH")
        .typeItemList!
        .firstWhere((value) => value.id == pitchId);
    emit(
      state.copyWith(currentPitch: currentPitch),
    );
  }

  Future<void> pullRefresh() async {
    emit(state.copyWith(status: FetchProjectDetailStatus.loading));
    try {
      final projectId = state.projectDetailById!.id!;
      final ProjectDetail? projectDetailById =
          await repository.fetchProjectById(projectId);
      emit(
        state.copyWith(
          status: FetchProjectDetailStatus.success,
          projectDetailById: projectDetailById,
          isHasPullRequestEvent: true,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: FetchProjectDetailStatus.failure));
    }
  }

  void onSetIsHasPullRequestEventDefault() {
    emit(state.copyWith(isHasPullRequestEvent: false));
  }
}
