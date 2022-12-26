import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/models/models.dart';
import 'package:rsi/resources/global.dart';
import 'package:rsi/resources/repository.dart';

part 'wallet_transaction_overview_state.dart';

class WalletTransactionOverviewCubit
    extends Cubit<WalletTransactionOverviewState> {
  final Repository repository = new Repository();
  WalletTransactionOverviewCubit()
      : super(const WalletTransactionOverviewState(
            recentlyWalletTransactions: [], walletTransactionOfTempWallet: []));
  init() {
    emit(WalletTransactionOverviewState(
        recentlyWalletTransactions: [], walletTransactionOfTempWallet: []));
  }

  Future<void> fetchRecentlyWalletTransaction(String walletId) async {
    emit(state.copyWith(status: WalletTransactionOverviewStatus.loading));
    try {
      // ignore: non_constant_identifier_names
      final tuple2_numOfWalletTransaction_listOfWalletTransactions =
          await repository.fetchWalletTransactionsByParams(
        params: {
          "walletId": walletId,
          "pageIndex": 1,
          "pageSize": 6,
        },
      );
      final recentlyWalletTransactions =
          tuple2_numOfWalletTransaction_listOfWalletTransactions.item2;
      emit(state.copyWith(
        status: WalletTransactionOverviewStatus.success,
        recentlyWalletTransactions: recentlyWalletTransactions,
      ));
    } catch (e) {
      emit(state.copyWith(status: WalletTransactionOverviewStatus.failure));
    }
  }

  Future<void> fetchAllWalletTransactionTempWallet() async {
    emit(state.copyWith(status: WalletTransactionOverviewStatus.loading));
    try {
      final context = Global.useContext()!;
      final tempWalletId =
          BlocProvider.of<WalletCubit>(context).state.walletList[0].id;
      // ignore: non_constant_identifier_names
      final tuple2_numOfWalletTransaction_listOfWalletTransactions =
          await repository.fetchWalletTransactionsByParams(
        params: {
          "walletId": tempWalletId,
        },
      );
      final walletTransactionOfTempWallet =
          tuple2_numOfWalletTransaction_listOfWalletTransactions.item2;
      emit(state.copyWith(
        status: WalletTransactionOverviewStatus.success,
        walletTransactionOfTempWallet: walletTransactionOfTempWallet,
      ));
    } catch (e) {
      emit(state.copyWith(status: WalletTransactionOverviewStatus.failure));
    }
  }
}
