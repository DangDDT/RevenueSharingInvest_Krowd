part of 'investor_overview_cubit.dart';

enum InvestorOverviewStatus {
  initial,
  loading,
  success,
  failure,
}

class InvestorOverviewState extends Equatable {
  final InvestorOverviewStatus status;
  final InvestorOverview overview;
  const InvestorOverviewState({
    this.status = InvestorOverviewStatus.initial,
    this.overview = const InvestorOverview(),
  });
  InvestorOverviewState copyWith(
      {InvestorOverviewStatus? status, InvestorOverview? overview}) {
    return InvestorOverviewState(
      status: status ?? this.status,
      overview: overview ?? this.overview,
    );
  }

  @override
  List<Object?> get props => [status, overview];
}
