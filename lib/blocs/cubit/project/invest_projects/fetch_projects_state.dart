part of 'fetch_projects_cubit.dart';

enum FetchInvestProjectStatus {
  initial,
  loading,
  success,
  failure,
}

class FetchInvestProjectState extends Equatable {
  final FetchInvestProjectStatus status;
  final List<BasicProject>? projects;
  final List<BasicProject>? oldProjects;
  final bool? isFirstFetch;
  final num? numOfProject;
  const FetchInvestProjectState({
    this.status = FetchInvestProjectStatus.initial,
    this.projects,
    this.oldProjects,
    this.isFirstFetch = false,
    this.numOfProject,
  });

  FetchInvestProjectState copyWith(
      {FetchInvestProjectStatus? status,
      List<BasicProject>? projects,
      List<BasicProject>? oldProjects,
      bool? isFirstFetch,
      num? numOfProject}) {
    return FetchInvestProjectState(
      status: status ?? this.status,
      projects: projects ?? this.projects,
      oldProjects: oldProjects ?? this.oldProjects,
      isFirstFetch: isFirstFetch,
      numOfProject: numOfProject ?? this.numOfProject,
    );
  }

  @override
  List<Object?> get props => [status, projects, oldProjects, isFirstFetch];
}
