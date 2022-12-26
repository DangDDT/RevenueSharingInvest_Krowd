import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rsi/models/models.dart';
import 'package:rsi/resources/repository.dart';

part 'wallet_transaction_research_state.dart';

class WalletTransactionResearchCubit
    extends Cubit<WalletTransactionResearchState> {
  final Repository repository = new Repository();
  WalletTransactionResearchCubit()
      : super(const WalletTransactionResearchState(walletTransactions: []));
  Future<void> init(List<Wallet> wallets) async {
    emit(WalletTransactionResearchState(
        walletTransactions: [], wallets: wallets));
  }

  Future<void> onChangeSelectedWallet(Wallet newWallet) async {
    emit(state.copyWith(walletCondition: newWallet));
  }

  Future<void> fetchWalletTransactionByCondition() async {}
  void onChangeFromDate(DateTime newFromDate) {
    final newDate =
        "${newFromDate.day < 10 ? "0" : ""}${newFromDate.day}/${newFromDate.month < 10 ? "0" : ""}${newFromDate.month}/${newFromDate.year}";
    emit(state.copyWith(fromDateCondition: newDate));
  }

  Future<void> fetchWalletTransaction() async {
    emit(state.copyWith(status: WalletTransactionResearchStatus.loading));
    try {
      // ignore: non_constant_identifier_names
      final tuple2_numOfWalletTransaction_listOfWalletTransactions =
          await repository.fetchWalletTransactionsByParams(
        params: {
          "walletId": state.walletCondition?.id,
          "fromDate": "${state.fromDateCondition} 00:00:00",
          "toDate": "${state.toDateCondition} 23:59:59",
        },
      );
      final walletTransactions =
          tuple2_numOfWalletTransaction_listOfWalletTransactions.item2;
      final numOfTransaction =
          tuple2_numOfWalletTransaction_listOfWalletTransactions.item1;
      emit(state.copyWith(
        status: WalletTransactionResearchStatus.success,
        numOfWalletTransaction: numOfTransaction,
        walletTransactions: walletTransactions,
      ));
    } catch (e) {
      emit(state.copyWith(status: WalletTransactionResearchStatus.failure));
    }
  }

  void onChangeToDate(DateTime newToDate) {
    final newDate =
        "${newToDate.day < 10 ? "0" : ""}${newToDate.day}/${newToDate.month < 10 ? "0" : ""}${newToDate.month}/${newToDate.year}";
    emit(state.copyWith(toDateCondition: newDate));
  }
}
