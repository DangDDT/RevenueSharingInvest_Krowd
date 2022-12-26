part of 'fetch_invested_projects_cubit.dart';

enum FetchInvestedProjectStatus {
  initial,
  loading,
  success,
  failure,
}

const Map<String, List<dynamic>> renderProjectStatus = {
  "CALLING_FOR_INVESTMENT": [
    "Đang kêu gọi đầu tư",
    "Calling for investment",
    bOrange,
  ],
  "ACTIVE": [
    "Đang hoạt động",
    "Active",
    bGreen,
  ],
  "CALLING_TIME_IS_OVER": [
    "Quá hạn đầu tư",
    "Calling time is over",
    bRed,
  ],
};

class FetchInvestedProjectState extends Equatable {
  final FetchInvestedProjectStatus status;
  final List<InvestedProject>? projects;
  final int? numOfProject;
  const FetchInvestedProjectState(
      {this.status = FetchInvestedProjectStatus.initial,
      this.projects,
      this.numOfProject});

  FetchInvestedProjectState copyWith(
      {FetchInvestedProjectStatus? status,
      List<InvestedProject>? projects,
      int? numOfProject}) {
    return FetchInvestedProjectState(
      status: status ?? this.status,
      projects: projects ?? this.projects,
      numOfProject: numOfProject ?? this.numOfProject,
    );
  }

  @override
  List<Object?> get props => [status, projects, numOfProject];
}
