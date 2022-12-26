part of 'stage_return_cubit.dart';

enum StageReturnStatus {
  initial,
  loading,
  success,
  failure,
}

const Map<String, List<dynamic>> renderStageReturnStatus = {
  "UNDUE": [
    "Chưa đến hạn",
    "Undue",
    nGray5,
  ],
  "DUE": [
    "Đang thực hiện",
    "Due",
    bOrange,
  ],
  "DONE": [
    "Hoàn thành",
    "Done",
    bGreen,
  ]
};

class StageReturnState extends Equatable {
  final StageReturnStatus status;
  final List<StageReturn> stages;
  final List<Payment> payments;
  final String? projectId;
  final bool showAll;
  const StageReturnState({
    this.status = StageReturnStatus.initial,
    required this.stages,
    this.projectId,
    this.showAll = false,
    required this.payments,
  });
  StageReturnState copyWith(
      {StageReturnStatus? status,
      List<StageReturn>? stages,
      String? projectId,
      bool? showAll,
      List<Payment>? payments}) {
    return StageReturnState(
      status: status ?? this.status,
      stages: stages ?? this.stages,
      projectId: projectId ?? this.projectId,
      showAll: showAll ?? this.showAll,
      payments: payments ?? this.payments,
    );
  }

  @override
  List<Object?> get props => [status, stages, projectId, showAll, payments];
}
