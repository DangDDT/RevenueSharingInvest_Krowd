part of 'invested_project_detail_cubit.dart';

enum InvestedProjectDetailStatus {
  initial,
  loading,
  success,
  failure,
}

class InvestedProjectDetailState extends Equatable {
  final InvestedProjectDetailStatus status;
  final InvestedProjectDetail? project;
  const InvestedProjectDetailState({
    this.status = InvestedProjectDetailStatus.initial,
    this.project,
  });
  InvestedProjectDetailState copyWith({
    InvestedProjectDetailStatus? status,
    InvestedProjectDetail? project,
  }) {
    return InvestedProjectDetailState(
      status: status ?? this.status,
      project: project ?? this.project,
    );
  }

  @override
  List<Object?> get props => [status];
}
