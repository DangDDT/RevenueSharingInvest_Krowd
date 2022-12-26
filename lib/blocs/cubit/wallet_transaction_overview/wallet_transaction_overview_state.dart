part of 'wallet_transaction_overview_cubit.dart';

enum WalletTransactionOverviewStatus {
  initial,
  loading,
  success,
  failure,
}

class WalletTransactionOverviewState extends Equatable {
  final WalletTransactionOverviewStatus status;
  final List<WalletTransaction> recentlyWalletTransactions;
  final List<WalletTransaction> walletTransactionOfTempWallet;
  const WalletTransactionOverviewState({
    this.status = WalletTransactionOverviewStatus.initial,
    required this.recentlyWalletTransactions,
    required this.walletTransactionOfTempWallet,
  });
  WalletTransactionOverviewState copyWith({
    WalletTransactionOverviewStatus? status,
    List<WalletTransaction>? recentlyWalletTransactions,
    List<WalletTransaction>? walletTransactionOfTempWallet,
  }) {
    return WalletTransactionOverviewState(
        status: status ?? this.status,
        recentlyWalletTransactions:
            recentlyWalletTransactions ?? this.recentlyWalletTransactions,
        walletTransactionOfTempWallet: walletTransactionOfTempWallet ??
            this.walletTransactionOfTempWallet);
  }

  @override
  List<Object?> get props =>
      [status, recentlyWalletTransactions, walletTransactionOfTempWallet];
}
