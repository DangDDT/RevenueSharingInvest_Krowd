import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:rsi/models/models.dart';
import 'package:rsi/resources/repository.dart';

part 'project_update_state.dart';

class ProjectUpdateCubit extends Cubit<ProjectUpdateState> {
  final Repository repository = new Repository();
  ProjectUpdateCubit() : super(const ProjectUpdateState());

  Future<void> fetchUpdates(String projectId) async {
    emit(state.copyWith(status: ProjectUpdateStatus.loading));
    try {
      final updates = await repository.fetchProjectUpdate(projectId);
      emit(state.copyWith(
          status: ProjectUpdateStatus.success, projectUpdate: updates));
    } catch (e) {
      debugPrint(e.toString());
      emit(state.copyWith(status: ProjectUpdateStatus.failure));
    }
  }
}
