part of 'project_update_cubit.dart';

enum ProjectUpdateStatus {
  initial,
  loading,
  success,
  failure,
}

class ProjectUpdateState extends Equatable {
  final ProjectUpdateStatus status;
  final List<ProjectUpdate>? projectUpdate;
  const ProjectUpdateState({
    this.status = ProjectUpdateStatus.initial,
    this.projectUpdate,
  });
  ProjectUpdateState copyWith(
      {ProjectUpdateStatus? status, List<ProjectUpdate>? projectUpdate}) {
    return ProjectUpdateState(
        status: status ?? this.status,
        projectUpdate: projectUpdate ?? this.projectUpdate);
  }

  @override
  List<Object?> get props => [status, projectUpdate];
}
