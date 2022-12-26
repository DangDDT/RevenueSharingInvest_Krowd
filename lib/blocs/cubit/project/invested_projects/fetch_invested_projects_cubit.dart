import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/models/models.dart';
import 'package:rsi/resources/repository.dart';

part 'fetch_invested_projects_state.dart';

class FetchInvestedProjectCubit extends Cubit<FetchInvestedProjectState> {
  final Repository repository = new Repository();
  FetchInvestedProjectCubit() : super(const FetchInvestedProjectState());

  Future<void> loadInvestedProjects() async {
    emit(state.copyWith(
      status: FetchInvestedProjectStatus.loading,
    ));
    try {
      // ignore: non_constant_identifier_names
      final tuple2_numOfProject_investedProject =
          await repository.fetchInvestedProjects();
      final numOfProject = tuple2_numOfProject_investedProject.item1;
      final investedProject = tuple2_numOfProject_investedProject.item2;
      final f = DateFormat('dd/MM/yyyy');
      investedProject!.sort((a, b) => f
          .parse(b.lastestInvestmentDate!)
          .compareTo(f.parse(a.lastestInvestmentDate!)));
      emit(
        state.copyWith(
          status: FetchInvestedProjectStatus.success,
          numOfProject: numOfProject,
          projects: investedProject,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: FetchInvestedProjectStatus.failure));
    }
  }
}
