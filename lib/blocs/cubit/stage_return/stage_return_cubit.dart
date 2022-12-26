// ignore_for_file: non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/models/models.dart';
import 'package:rsi/resources/repository.dart';
part 'stage_return_state.dart';

class StageReturnCubit extends Cubit<StageReturnState> {
  final Repository repository = new Repository();
  StageReturnCubit() : super(const StageReturnState(stages: [], payments: []));

  Future<void> init({required String projectId}) async {
    emit(state.copyWith(projectId: projectId));
  }

  Future<void> fetchReturnStages() async {
    emit(state.copyWith(status: StageReturnStatus.loading));
    try {
      final params = state.showAll ? null : {"status": "DUE"};
      final tuple2_numOfProject_listOfStage =
          await repository.fetchReturnStageByProjectId(state.projectId!, params: params);
      final tuple2_numOfPayment_listOfPeriodRevenuePayment =
          await repository.fetchPeriodRevenuePaymentByProjectId(projectId: state.projectId!);
      final stages = tuple2_numOfProject_listOfStage.item2;
      final payments = tuple2_numOfPayment_listOfPeriodRevenuePayment.item2;
      emit(state.copyWith(status: StageReturnStatus.success, stages: stages, payments: payments));
    } catch (e) {
      debugPrint(e.toString());
      emit(state.copyWith(status: StageReturnStatus.failure));
    }
  }

  void onChangeSwitch(bool isShowAll) {
    emit(state.copyWith(showAll: isShowAll));
    fetchReturnStages();
  }
}
