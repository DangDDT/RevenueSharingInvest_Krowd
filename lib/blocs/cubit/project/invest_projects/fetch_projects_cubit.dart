import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/models/models.dart';
import 'package:rsi/resources/repository.dart';

part 'fetch_projects_state.dart';

class FetchInvestProjectCubit extends Cubit<FetchInvestProjectState> {
  final Repository repository = new Repository();
  int page = 1;
  FetchInvestProjectCubit() : super(const FetchInvestProjectState());
  Future<void> init() async {
    page = 1;
    emit(
      FetchInvestProjectState(
        isFirstFetch: true,
        numOfProject: null,
        oldProjects: [],
        projects: [],
        status: FetchInvestProjectStatus.initial,
      ),
    );
  }

  Future<void> loadProjects(bool isScroll, String selectedFieldId) async {
    if (!isScroll && page != 1) return;
    if (state.status == FetchInvestProjectStatus.loading) return;
    final currentState = state;

    List<BasicProject> oldProjects = List<BasicProject>.empty(growable: true);

    if (currentState.status == FetchInvestProjectStatus.success) {
      oldProjects = currentState.projects!;
    }
    emit(
      state.copyWith(
        status: FetchInvestProjectStatus.loading,
        oldProjects: oldProjects,
        isFirstFetch: page == 1,
      ),
    );
    try {
      if (oldProjects.length == state.numOfProject && page != 1) {
        emit(state.copyWith(
            status: FetchInvestProjectStatus.success,
            projects: state.oldProjects));
      } else {
        repository
            .fetchProjects(
                page, selectedFieldId != "0000" ? selectedFieldId : null)
            .then((tuple2) {
          final projects = state.oldProjects;
          final numOfProject = tuple2.item1;
          final newProjects = tuple2.item2;
          if (page == 1) {
            emit(
              state.copyWith(
                numOfProject: numOfProject,
              ),
            );
          }
          page++;
          if (newProjects != null) projects!.addAll(newProjects);
          emit(
            state.copyWith(
              status: FetchInvestProjectStatus.success,
              projects: projects,
            ),
          );
        });
      }
    } catch (e) {
      emit(state.copyWith(status: FetchInvestProjectStatus.failure));
    }
  }
}
