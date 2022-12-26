part of 'withdraw_cubit.dart';

enum WithdrawStatus {
  initial,
  loading,
  success,
  failure,
  invalid,
  inputing,
}

class WithdrawState extends Equatable {
  final WithdrawStatus status;
  final int withdrawValueInt;
  final String? withdrawValueString;
  final double balanceInvestmentWallet;
  final String? walletSelectedId;
  final String withdrawValueError;
  final String bankName;
  final String bankNameError;
  final String bankAccount;
  final String bankAccountError;
  final String bankAccountName;
  final String bankAccountNameError;
  final bool useDefaultAccount;
  const WithdrawState({
    this.status = WithdrawStatus.initial,
    this.withdrawValueInt = 0,
    this.withdrawValueString = "0",
    this.balanceInvestmentWallet = 0,
    this.walletSelectedId,
    this.withdrawValueError = "",
    this.bankName = "",
    this.bankNameError = "",
    this.bankAccount = "",
    this.bankAccountError = "",
    this.bankAccountName = "",
    this.bankAccountNameError = "",
    this.useDefaultAccount = false,
  });

  WithdrawState copyWith({
    WithdrawStatus? status,
    int? withdrawValueInt,
    String? withdrawValueString,
    String? walletSelectedId,
    double? balanceInvestmentWallet,
    String? withdrawValueError,
    String? bankName,
    String? bankNameError,
    String? bankAccount,
    String? bankAccountError,
    String? bankAccountName,
    String? bankAccountNameError,
    bool? useDefaultAccount,
  }) {
    return WithdrawState(
      status: status ?? this.status,
      withdrawValueInt: withdrawValueInt ?? this.withdrawValueInt,
      walletSelectedId: walletSelectedId ?? this.walletSelectedId,
      withdrawValueString: withdrawValueString ?? this.withdrawValueString,
      balanceInvestmentWallet:
          balanceInvestmentWallet ?? this.balanceInvestmentWallet,
      bankName: bankName ?? this.bankName,
      bankNameError: bankNameError ?? this.bankNameError,
      bankAccount: bankAccount ?? this.bankAccount,
      bankAccountError: bankAccountError ?? this.bankAccountError,
      bankAccountName: bankAccountName ?? this.bankAccountName,
      bankAccountNameError: bankAccountNameError ?? this.bankAccountNameError,
      useDefaultAccount: useDefaultAccount ?? this.useDefaultAccount,
      withdrawValueError: withdrawValueError ?? this.withdrawValueError,
    );
  }

  @override
  List<Object?> get props => [
        status,
        walletSelectedId,
        withdrawValueInt,
        withdrawValueString,
        balanceInvestmentWallet,
        bankName,
        bankNameError,
        bankAccount,
        bankAccountError,
        bankAccountName,
        bankAccountNameError,
        useDefaultAccount,
        withdrawValueError
      ];
}
