import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:rsi/models/models.dart';
import 'package:rsi/resources/repository.dart';

part 'invested_project_detail_state.dart';

class InvestedProjectDetailCubit extends Cubit<InvestedProjectDetailState> {
  final Repository repository = new Repository();
  InvestedProjectDetailCubit() : super(const InvestedProjectDetailState());
  Future<void> fetchInvestedProjectDetail(String projectId) async {
    emit(state.copyWith(status: InvestedProjectDetailStatus.loading));
    try {
      final project = await repository.fetchInvestedProjectsById(projectId);
      emit(state.copyWith(
          status: InvestedProjectDetailStatus.success, project: project));
    } catch (e) {
      debugPrint(e.toString());
      emit(state.copyWith(status: InvestedProjectDetailStatus.failure));
    }
  }
}
