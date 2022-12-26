import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/models/models.dart';
import 'package:rsi/resources/global.dart';
import 'package:rsi/resources/repository.dart';
import 'package:rsi/router/router_constants.dart';

part 'withdraw_state.dart';

class WithdrawCubit extends Cubit<WithdrawState> {
  final Repository repository = new Repository();
  WithdrawCubit() : super(const WithdrawState());

  init(String walletSelectedId, double initBalance) {
    emit(
      WithdrawState(
        walletSelectedId: walletSelectedId,
        balanceInvestmentWallet: initBalance,
      ),
    );
  }

  void onWithdrawChange(String value) {
    final withdrawValueString = value != "" ? value : "0";
    final withdrawValueInt = int.parse(withdrawValueString.replaceAll(",", ""));
    emit(state.copyWith(
      status: WithdrawStatus.inputing,
      withdrawValueString: withdrawValueString,
      withdrawValueInt: withdrawValueInt,
    ));
  }

  void onBankNameChange(String newBankName) {
    emit(state.copyWith(bankName: newBankName));
  }

  void onBankAccountChange(String newBankAccount) {
    emit(state.copyWith(bankAccount: newBankAccount));
  }

  void onBankAccountNameChange(String newBankAccountName) {
    emit(state.copyWith(bankAccountName: newBankAccountName));
  }

  void onUseDefaultAccount(bool? use) {
    if (use == true) {
      final context = Global.useContext()!;
      final defaultUserState =
          BlocProvider.of<UserCubit>(context).state.userProfile!;
      final bankName = defaultUserState.bankName!;
      final bankAccount = defaultUserState.bankAccount!;
      final bankAccountName =
          "${defaultUserState.firstName} ${defaultUserState.lastName}";
      emit(state.copyWith(
        bankName: bankName,
        bankAccount: bankAccount,
        bankAccountName: bankAccountName,
        bankNameError: "",
        bankAccountNameError: "",
        bankAccountError: "",
        useDefaultAccount: use,
      ));
    } else {
      emit(
        state.copyWith(
          bankName: "",
          bankAccount: "",
          bankAccountName: "",
          bankNameError: "",
          bankAccountNameError: "",
          bankAccountError: "",
          useDefaultAccount: use,
        ),
      );
    }
  }

  void onSubmit() {
    final bankNameError = notNullString(state.bankName);
    final bankAccountError = notNullString(state.bankAccount);
    final bankAccountNameError = notNullString(state.bankAccountName);
    final withdrawValueError = amountValidation();
    final isValid = bankNameError == "" &&
        bankAccountError == "" &&
        bankAccountNameError == "" &&
        withdrawValueError == "";
    if (!isValid) {
      emit(
        state.copyWith(
          bankNameError: bankNameError,
          bankAccountError: bankAccountError,
          bankAccountNameError: bankAccountNameError,
          withdrawValueError: withdrawValueError,
        ),
      );
    } else {
      emit(
        state.copyWith(
          bankNameError: bankNameError,
          bankAccountError: bankAccountError,
          bankAccountNameError: bankAccountNameError,
          withdrawValueError: withdrawValueError,
        ),
      );
      final context = Global.useContext()!;
      context.loaderOverlay.show();
      context.read<WithdrawRequestCubit>()
        ..init()
        ..postWithdrawRequest(
                req: new WithdrawRequestPost(
                    fromWalletId: state.walletSelectedId!,
                    bankName: state.bankName,
                    accountName: state.bankAccountName,
                    bankAccount: state.bankAccount,
                    amount: state.withdrawValueInt))
            .whenComplete(() {
          context.loaderOverlay.hide();
          Navigator.pushReplacementNamed(context, withdrawStatusRoute);
        });
    }
  }

  String notNullString(String? string) {
    if (string == null || string.trim() == "")
      return "*Bắt buộc";
    else
      return "";
  }

  String amountValidation() {
    if (state.withdrawValueInt > state.balanceInvestmentWallet) {
      return "Số tiền bạn đã vượt quá số dư ví";
    }
    if (state.withdrawValueInt <= 0) {
      return "Số tiền bạn rút phải lớn hơn 0";
    }
    if (state.withdrawValueInt < 100000) {
      return "Số tiền rút tối thiểu là 100,000 đ";
    }
    if (state.withdrawValueInt > 500000000) {
      return "Số tiền rút tối đa trong 1 lần rút là 500,000,000 đ";
    } else
      return "";
  }
}
