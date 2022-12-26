import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rsi/models/models.dart';
import 'package:rsi/resources/repository.dart';

part 'investor_overview_state.dart';

class InvestorOverviewCubit extends Cubit<InvestorOverviewState> {
  final Repository repository = new Repository();
  InvestorOverviewCubit() : super(const InvestorOverviewState());

  Future<void> fetchOverview() async {
    emit(state.copyWith(status: InvestorOverviewStatus.loading));
    try {
      final overview = await repository.fetchMoneyOverview();
      emit(state.copyWith(
          status: InvestorOverviewStatus.success, overview: overview));
    } catch (e) {
      emit(state.copyWith(status: InvestorOverviewStatus.failure));
    }
  }
}
