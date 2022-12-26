import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_formatter/numeric_formatter.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:intl/intl.dart' as intl;
import 'package:rsi/ui/_common/textfields/required_textfield.dart';
import 'package:rsi/ui/_common/textfields/topup_textfield.dart';
import 'package:rsi/ui/_common/unordered_list.dart';
import 'package:sizer/sizer.dart';

class WithdrawScreen extends StatefulWidget {
  @override
  _WithdrawScreenState createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  void _onPop() => Navigator.pop(context);
  final formatter = intl.NumberFormat.decimalPattern();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final balanceInvestmentWallet =
        context.read<WithdrawCubit>().state.balanceInvestmentWallet;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        toolbarHeight: size.height * 0.07,
        backgroundColor: kPrimaryColor,
        leading: InkWell(
          onTap: _onPop,
          child: Icon(
            Icons.chevron_left,
            color: nWhite,
          ),
        ),
        title: Text(
          "Rút tiền",
          style: TextStyle(
            fontSize: kFontSize + 2,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            color: kLightTextColor,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(kDefaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: nWhite,
                  borderRadius: BorderRadius.circular(kBorder),
                  boxShadow: kBoxShadow,
                ),
                margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
                padding: EdgeInsets.all(kDefaultPadding),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: nGray1,
                        borderRadius: BorderRadius.circular(kBorder),
                      ),
                      child: ListTile(
                        horizontalTitleGap: 0,
                        leading: Image.asset(
                          "assets/images/logo.png",
                          width: 30,
                          height: 30,
                        ),
                        title: Text(
                          "Số dư ví:",
                          style: TextStyle(fontSize: kFontSize),
                        ),
                        trailing: Text(
                          "${formatter.format(balanceInvestmentWallet)} đ",
                          style: TextStyle(
                            fontSize: kFontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      child: withDrawField(context, "Số tiền cần rút"),
                    ),
                    UnorderedList([
                      "Số tiền tối thiểu bạn có thể rút là 100,000 đ",
                      "Số tiền tối đa bạn có thể rút trong 1 lần là 500,000,000 đ",
                    ])
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Thông tin rút tiền",
                  style: TextStyle(
                    fontSize: kFontSize + 4,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              BlocBuilder<WithdrawCubit, WithdrawState>(
                builder: (context, state) {
                  if (state.useDefaultAccount == false) {
                    return Container(
                      decoration: BoxDecoration(
                        color: nWhite,
                        borderRadius: BorderRadius.circular(kBorder),
                        boxShadow: kBoxShadow,
                      ),
                      margin: EdgeInsets.only(top: kDefaultPadding),
                      padding: EdgeInsets.all(kDefaultPadding),
                      child: Column(
                        children: [
                          Container(
                            margin:
                                EdgeInsets.symmetric(vertical: kDefaultPadding),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                bankNameField(context, "Tên ngân hàng"),
                                bankAccountField(context, "Số tài khoản"),
                                bankAccountNameField(
                                    context, "Tên chủ tài khoản"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Container(
                      decoration: BoxDecoration(
                        color: nWhite,
                        borderRadius: BorderRadius.circular(kBorder),
                        boxShadow: kBoxShadow,
                      ),
                      margin: EdgeInsets.only(top: kDefaultPadding),
                      padding: EdgeInsets.all(kDefaultPadding),
                      child: Column(
                        children: [
                          Container(
                            margin:
                                EdgeInsets.symmetric(vertical: kDefaultPadding),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                bankNameDefaultField(context, "Tên ngân hàng"),
                                bankAccountDefaultField(
                                    context, "Số tài khoản"),
                                bankAccountNameDefaultField(
                                    context, "Tên chủ tài khoản")
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
              useDefautAccountCheckbox(),
              Container(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
                      child: Text(
                        "Lưu ý",
                        style: TextStyle(
                          fontSize: kFontSize + 4,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    UnorderedList([
                      "Số tiền bạn rút sẽ được chuyển vào tài khoản của bạn chậm nhất là 24h sau khi tạo lệnh rút tiền.",
                      "Số tiền bạn rút không được vượt quá số dư trong ví.",
                      "Thông tin rút tiền là thông tin tài khoản của bạn hoặc thông tin người mà bạn quen biết.",
                      "Tên chủ tài khoản phải trùng với tên chủ tài khoản bạn đăng ký với ngân hàng.",
                      "Vui lòng kiểm tra tất cả thông tin trước khi nhấn lệnh rút tiền.",
                    ])
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomBarWidget(),
    );
  }

  Widget bottomBarWidget() {
    return Container(
      height: 10.h,
      color: nWhite,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: BlocBuilder<WithdrawCubit, WithdrawState>(
          builder: (context, state) {
            final isLoading = state.status == TopupStatus.loading;
            return Container(
              padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
              child: ElevatedButton.icon(
                icon: isLoading
                    ? const CircularProgressIndicator()
                    : const Icon(Icons.add),
                label: Text(
                  isLoading ? 'Đang xử lý' : 'Rút tiền',
                  style: const TextStyle(fontSize: kFontSize + 2),
                ),
                onPressed: () => context.read<WithdrawCubit>().onSubmit(),
                style:
                    ElevatedButton.styleFrom(backgroundColor: kSecondaryColor),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget withDrawField(BuildContext context, String title) {
    return BlocBuilder<WithdrawCubit, WithdrawState>(builder: (context, state) {
      return TopupTextField(
        onChangedString: context.read<WithdrawCubit>().onWithdrawChange,
        keyboardType: TextInputType.number,
        title: title,
        inputFormatters: [ThousandsFormatter()],
        errorText:
            state.withdrawValueError != "" ? state.withdrawValueError : null,
        currentText: state.withdrawValueString,
        endIcon: Container(
          child: Text(
            "đ",
            style: TextStyle(
              fontSize: kFontSize,
              fontWeight: FontWeight.bold,
              color: nGray5,
            ),
          ),
        ),
      );
    });
  }

  Widget bankNameField(BuildContext context, String title) {
    return BlocBuilder<WithdrawCubit, WithdrawState>(
      builder: (context, state) {
        return RequiredTextField(
          onChangedString: context.read<WithdrawCubit>().onBankNameChange,
          title: title,
          errorText: state.bankNameError != "" ? state.bankNameError : null,
        );
      },
    );
  }

  Widget bankNameDefaultField(BuildContext context, String title) {
    return BlocBuilder<WithdrawCubit, WithdrawState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: kDefaultPadding - 10),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: nGray4),
            borderRadius: BorderRadius.circular(kBorder),
          ),
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(
                color: nGray5,
                fontSize: kFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Text(
              state.bankName.toString(),
              style: TextStyle(
                color: nGray5,
                fontSize: kFontSize - 2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget bankAccountField(BuildContext context, String title) {
    return BlocBuilder<WithdrawCubit, WithdrawState>(
      builder: (context, state) {
        return RequiredTextField(
          onChangedString: context.read<WithdrawCubit>().onBankAccountChange,
          title: title,
          errorText:
              state.bankAccountError != "" ? state.bankAccountError : null,
        );
      },
    );
  }

  Widget bankAccountDefaultField(BuildContext context, String title) {
    return BlocBuilder<WithdrawCubit, WithdrawState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: kDefaultPadding - 10),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: nGray4),
            borderRadius: BorderRadius.circular(kBorder),
          ),
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(
                color: nGray5,
                fontSize: kFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Text(
              state.bankAccount.toString(),
              style: TextStyle(
                color: nGray5,
                fontSize: kFontSize - 2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget bankAccountNameField(BuildContext context, String title) {
    return BlocBuilder<WithdrawCubit, WithdrawState>(
      builder: (context, state) {
        return RequiredTextField(
          onChangedString:
              context.read<WithdrawCubit>().onBankAccountNameChange,
          title: title,
          errorText: state.bankAccountNameError != ""
              ? state.bankAccountNameError
              : null,
        );
      },
    );
  }

  Widget bankAccountNameDefaultField(BuildContext context, String title) {
    return BlocBuilder<WithdrawCubit, WithdrawState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: kDefaultPadding - 10),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: nGray4),
            borderRadius: BorderRadius.circular(kBorder),
          ),
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(
                color: nGray5,
                fontSize: kFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Text(
              state.bankAccountName.toString(),
              style: TextStyle(
                color: nGray5,
                fontSize: kFontSize - 2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget useDefautAccountCheckbox() {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        final user = state.userProfile!;
        bool isEnable = true;
        if (user.bankName == null ||
            user.bankAccount == null ||
            "${user.firstName} ${user.lastName}".toString().trim() == "") {
          isEnable = false;
        }
        return BlocBuilder<WithdrawCubit, WithdrawState>(
          builder: (context, state) {
            return CheckboxListTile(
              enabled: isEnable,
              controlAffinity: ListTileControlAffinity.leading,
              title: Text('Sử dụng tài khoản mặc định',
                  style: TextStyle(fontSize: kFontSize)),
              value: state.useDefaultAccount,
              onChanged: context.read<WithdrawCubit>().onUseDefaultAccount,
            );
          },
        );
      },
    );
  }
}
