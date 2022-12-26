import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/models/models.dart';
import 'package:rsi/resources/global.dart';
import 'package:rsi/resources/repository.dart';

part 'investment_state.dart';

class InvestmentCubit extends Cubit<InvestmentState> {
  final Repository repository = new Repository();

  InvestmentCubit() : super(const InvestmentState(investments: []));

  Future<void> init(InvestmentRequestPost req) async {
    emit(InvestmentState(investments: [], req: req));
  }

  Future<void> postInvestment() async {
    emit(state.copyWith(status: InvestmentStatus.loading));
    try {
      final res = await repository.postInvestmentRequest(state.req!);
      emit(state.copyWith(status: InvestmentStatus.success, res: res));
    } catch (e) {
      debugPrint(e.toString());
      emit(state.copyWith(status: InvestmentStatus.failure));
    } finally {
      final context = Global.useContext()!;
      BlocProvider.of<WalletCubit>(context).loadWallets();
    }
  }

  Future<void> fetchInvestment() async {
    emit(state.copyWith(
        status: InvestmentStatus.loading, investments: [], numOfInvestment: 0));
    try {
      // ignore: non_constant_identifier_names
      final tuple2_numOfInvestment_listOfInvestments =
          await repository.fetchInvestments();
      final numOfInvestment = tuple2_numOfInvestment_listOfInvestments.item1;
      final listOfInvestment = tuple2_numOfInvestment_listOfInvestments.item2;
      emit(state.copyWith(
          status: InvestmentStatus.success,
          numOfInvestment: numOfInvestment,
          investments: listOfInvestment));
    } catch (e) {
      emit(state.copyWith(status: InvestmentStatus.failure));
    }
  }

  Future<void> cancelInvestment(String investmentId) async {
    emit(state.copyWith(status: InvestmentStatus.loading));
    final canceledInvestment =
        state.investments.firstWhere((e) => e.id == investmentId);
    try {
      final cancelInvestmentStatus =
          await repository.cancelInvestment(investmentId);
      emit(state.copyWith(cancelInvestmentStatus: cancelInvestmentStatus));
    } catch (e) {
      emit(state.copyWith(cancelInvestmentStatus: false));
    } finally {
      emit(state.copyWith(
          status: InvestmentStatus.success,
          canceledInvestment: canceledInvestment));
      fetchInvestment();
    }
  }
}
