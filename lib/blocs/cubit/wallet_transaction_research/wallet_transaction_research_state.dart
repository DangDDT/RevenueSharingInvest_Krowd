part of 'wallet_transaction_research_cubit.dart';

enum WalletTransactionResearchStatus {
  initial,
  loading,
  success,
  failure,
}

enum WalletTransactionFilter { ALL, CASH_IN, CASH_OUT }

class WalletTransactionResearchState extends Equatable {
  final List<WalletTransaction> walletTransactions;
  final WalletTransactionResearchStatus status;
  final num numOfWalletTransaction;
  //Research WalletTransactions Screen State
  final String? fromDateCondition;
  final String? toDateCondition;
  final Wallet? walletCondition;
  final List<Wallet>? wallets;
  const WalletTransactionResearchState({
    this.status = WalletTransactionResearchStatus.initial,
    required this.walletTransactions,
    this.numOfWalletTransaction = 0,
    this.fromDateCondition,
    this.toDateCondition,
    this.walletCondition,
    this.wallets,
  });
  WalletTransactionResearchState copyWith({
    WalletTransactionResearchStatus? status,
    num? numOfWalletTransaction,
    List<WalletTransaction>? walletTransactions,
    String? fromDateCondition,
    String? toDateCondition,
    Wallet? walletCondition,
    List<Wallet>? wallets,
  }) {
    return WalletTransactionResearchState(
      status: status ?? this.status,
      numOfWalletTransaction:
          numOfWalletTransaction ?? this.numOfWalletTransaction,
      walletTransactions: walletTransactions ?? this.walletTransactions,
      fromDateCondition: fromDateCondition ?? this.fromDateCondition,
      toDateCondition: toDateCondition ?? this.toDateCondition,
      walletCondition: walletCondition ?? this.walletCondition,
      wallets: wallets ?? this.wallets,
    );
  }

  @override
  List<Object?> get props => [
        status,
        numOfWalletTransaction,
        walletTransactions,
        fromDateCondition,
        toDateCondition,
        walletCondition,
        wallets,
      ];
}
