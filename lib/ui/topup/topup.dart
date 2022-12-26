import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_formatter/numeric_formatter.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:intl/intl.dart' as intl;
import 'package:rsi/ui/_common/textfields/topup_textfield.dart';
import 'package:rsi/ui/_common/unordered_list.dart';
import 'package:sizer/sizer.dart';

import 'widgets/topup_method_card.dart';

class TopupScreen extends StatefulWidget {
  @override
  _TopupScreenState createState() => _TopupScreenState();
}

class _TopupScreenState extends State<TopupScreen>
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
          "Nạp tiền",
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
      body: Container(
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
                      trailing: BlocBuilder<WalletCubit, WalletState>(
                        builder: (context, state) {
                          final balanceInvestmentWallet =
                              state.walletList[1].balance;
                          return Text(
                            "${formatter.format(balanceInvestmentWallet)} đ",
                            style: TextStyle(
                              fontSize: kFontSize,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    child: topUpField(context, "Số tiền cần nạp"),
                  ),
                  UnorderedList([
                    "Số tiền tối thiểu bạn có thể nạp là 100,000 đ",
                    "Số tiền tối đa bạn có thể nạp trong 1 lần là 50,000,000 đ",
                  ])
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Nguồn tiền",
                    style: TextStyle(
                      fontSize: kFontSize + 6,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      color: kDarkTextColor,
                    ),
                  ),
                  InkWell(
                    onTap: () => {},
                    child: Text(
                      "Biểu phí giao dịch",
                      style: TextStyle(
                        fontSize: kFontSize - 4,
                        fontStyle: FontStyle.normal,
                        color: sBlue3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TopupMethodCard(
              methodName: "Ví Momo",
              methodLogo: "assets/images/momo-logo.png",
              topupMethodTypeValue: TopupMethodType.MOMO,
            ),
          ],
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
        child: BlocBuilder<TopupCubit, TopupState>(
          builder: (context, state) {
            final isLoading = state.status == TopupStatus.loading;
            return Container(
              padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
              child: ElevatedButton.icon(
                icon: isLoading
                    ? const CircularProgressIndicator()
                    : const Icon(Icons.add),
                label: Text(
                  isLoading ? 'Đang xử lý' : 'Nạp tiền',
                  style: const TextStyle(fontSize: kFontSize + 2),
                ),
                onPressed: isLoading
                    ? null
                    : () => context
                        .read<TopupCubit>()
                        .onButtonTopupPress(state.topupValueInt!),
                style:
                    ElevatedButton.styleFrom(backgroundColor: kSecondaryColor),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget topUpField(BuildContext context, String title) {
    return BlocBuilder<TopupCubit, TopupState>(
        buildWhen: (previous, current) =>
            previous.topupValueString != current.topupValueString,
        builder: (context, state) {
          return TopupTextField(
            onChangedString: (topupValue) =>
                context.read<TopupCubit>().onTopupChange(topupValue),
            keyboardType: TextInputType.number,
            title: title,
            inputFormatters: [ThousandsFormatter()],
            currentText: state.topupValueString,
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
}
