part of 'account_transaction_cubit.dart';

enum AccountTransactionStatus {
  initial,
  loading,
  success,
  failure,
}

enum AccountTransactionFilter { ALL, CASH_IN, CASH_OUT }

const Map<String, String> orderType_image = {
  "momo_wallet": "assets/images/momo-logo.png",
  "system": "assets/images/logo.png"
};
const Map<String, String> payType_image = {
  "qr": "assets/images/qr-code.png",
  "app": "assets/images/mobile_app.png"
};

class AccountTransactionState extends Equatable {
  final AccountTransactionStatus status;
  final List<AccountTransaction> accountTransactions;
  final AccountTransactionFilter filter;
  final List<AccountTransaction> filterAccountTransactions;
  const AccountTransactionState({
    this.status = AccountTransactionStatus.initial,
    required this.accountTransactions,
    this.filter = AccountTransactionFilter.ALL,
    required this.filterAccountTransactions,
  });

  AccountTransactionState copyWith({
    AccountTransactionStatus? status,
    List<AccountTransaction>? accountTransactions,
    AccountTransactionFilter? filter,
    List<AccountTransaction>? filterAccountTransactions,
  }) {
    return AccountTransactionState(
      status: status ?? this.status,
      accountTransactions: accountTransactions ?? this.accountTransactions,
      filter: filter ?? this.filter,
      filterAccountTransactions:
          filterAccountTransactions ?? this.filterAccountTransactions,
    );
  }

  @override
  List<Object?> get props =>
      [status, accountTransactions, filter, filterAccountTransactions];
}
