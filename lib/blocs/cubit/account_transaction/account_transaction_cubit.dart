import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rsi/models/models.dart';
import 'package:rsi/resources/repository.dart';

part 'account_transaction_state.dart';

class AccountTransactionCubit extends Cubit<AccountTransactionState> {
  final Repository repository = new Repository();
  AccountTransactionCubit()
      : super(const AccountTransactionState(
            accountTransactions: [], filterAccountTransactions: []));

  Future<void> fetchAccountTransactions() async {
    emit(state.copyWith(status: AccountTransactionStatus.loading));
    try {
      final accountTransactions = await repository.fetchAccountTransactions();
      emit(
        state.copyWith(
          status: AccountTransactionStatus.success,
          accountTransactions:
              accountTransactions!.where((e) => e.resultCode == "0").toList(),
          filterAccountTransactions:
              accountTransactions.where((e) => e.resultCode == "0").toList(),
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: AccountTransactionStatus.failure));
    }
  }

  void onChangeFilterMode(int index) {
    emit(state.copyWith(filter: AccountTransactionFilter.values[index]));
    List<AccountTransaction> filterAccountTransaction = [];
    switch (state.filter) {
      case AccountTransactionFilter.ALL:
        filterAccountTransaction = state.accountTransactions;
        break;
      case AccountTransactionFilter.CASH_IN:
        filterAccountTransaction = state.accountTransactions
            .where((value) => value.type == "TOP-UP")
            .toList();
        break;
      case AccountTransactionFilter.CASH_OUT:
        filterAccountTransaction = state.accountTransactions
            .where((value) => value.type == "WITHDRAW")
            .toList();
        break;
      default:
        filterAccountTransaction = [];
    }

    emit(state.copyWith(filterAccountTransactions: filterAccountTransaction));
  }
}
