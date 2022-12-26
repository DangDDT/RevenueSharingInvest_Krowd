part of 'sample_cubit.dart';

enum SampleStatus {
  initial,
  loading,
  success,
  failure,
}

class SampleState extends Equatable {
  final SampleStatus status;
  const SampleState({
    this.status = SampleStatus.initial,
  });
  SampleState copyWith({SampleStatus? status}) {
    return SampleState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status];
}
