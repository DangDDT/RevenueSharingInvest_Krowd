import 'package:flutter/material.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/l10n/support_locale.dart';
import 'package:rsi/router/router_constants.dart';
import 'package:rsi/ui/_common/dashline_separator.dart';
import 'package:rsi/ui/_common/icon_sticker.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart' as intl;

import 'button_wallet.dart';

// ignore: camel_case_types
enum WALLET_TYPE {
  I1_TEMP_WALLET,
  I2_INVESTMENT_WALLET,
  I3_ADVANCE_WALLET,
  I4_PROJECT_PAYMENT_FOR_BACKER_WALLET,
  I5_WITHDRAW_WALLET,
}

class WalletCard extends StatelessWidget {
  const WalletCard({
    Key? key,
    this.backgroundColor = kPrimaryColor,
    required this.stickerLink,
    required this.title,
    required this.subtitle,
    required this.stickerIconColor,
    required this.stickerBackgroundColor,
    this.walletType = WALLET_TYPE.I2_INVESTMENT_WALLET,
  }) : super(key: key);
  final Color? backgroundColor;
  final String stickerLink;
  final Color stickerIconColor;
  final Color stickerBackgroundColor;
  final String title;
  final String subtitle;
  final walletType;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kBorder),
      ),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorder + 4),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: backgroundColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(kDefaultPadding - 4),
              child: Column(
                children: [
                  Container(
                    height: 10.h,
                    child: ListTile(
                      leading: IconSticker(
                        color: stickerIconColor,
                        imageLink: stickerLink,
                        backgroundColor: stickerBackgroundColor,
                      ),
                      title: Container(
                        height: 30,
                        child: Text(
                          title,
                          style: TextStyle(
                            color: kLightTextColor,
                            fontSize: kFontSize,
                          ),
                        ),
                      ),
                      subtitle: Text(
                        subtitle,
                        style: TextStyle(
                          color: kLightTextColor,
                          fontSize: kFontSize + 4,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  renderBottomActionWallet(walletType, context)
                ],
              ),
            ),
          ),
          Positioned(
            top: -20,
            right: -20,
            child: Icon(
              Icons.circle,
              color: nWhite.withOpacity(.2),
              size: 100,
            ),
          ),
          Positioned(
            top: -50,
            right: -30,
            child: Icon(
              Icons.circle,
              color: nWhite.withOpacity(.2),
              size: 180,
            ),
          )
        ]),
      ),
    );
  }

  Widget renderBottomActionWallet(walletType, BuildContext context) {
    final l10n = L10n.useL10n();
    final formatter = intl.NumberFormat.decimalPattern();
    switch (walletType) {
      // case WALLET_TYPE.I1_TEMP_WALLET:
      //   return Column(
      //     children: [
      //       Container(
      //         decoration: BoxDecoration(
      //           color: nWhite,
      //           borderRadius: BorderRadius.circular(kBorder),
      //           boxShadow: kBoxShadow,
      //         ),
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //           children: <Widget>[
      //             ListTile(
      //               contentPadding: EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: 8),
      //               minLeadingWidth: 0,
      //               leading: IconSticker(
      //                 color: stickerBackgroundColor,
      //                 imageLink: "assets/icons/arrow-right.png",
      //                 backgroundColor: bGreen,
      //                 iconSize: 60,
      //               ),
      //               title: Text(
      //                 "Nạp tiền",
      //                 style: TextStyle(
      //                   fontSize: kFontSize,
      //                   fontWeight: FontWeight.bold,
      //                   color: bGreen,
      //                 ),
      //               ),
      //               trailing: BlocBuilder<WalletTransactionOverviewCubit, WalletTransactionOverviewState>(
      //                 builder: (context, state) {
      //                   var totalDeposit = 0.0;
      //                   if (state.status != WalletTransactionOverviewStatus.loading &&
      //                       state.walletTransactionOfTempWallet.length > 0) {
      //                     final depositTransactions =
      //                         state.walletTransactionOfTempWallet.where((e) => e.type == "DEPOSIT");
      //                     if (depositTransactions.length > 0)
      //                       totalDeposit = depositTransactions
      //                           .map((e) => e.amount)
      //                           .whereType<double>()
      //                           .toList()
      //                           .reduce((a, b) => a + b);
      //                   }
      //                   return Text(
      //                     "+ ${formatter.format(totalDeposit)} đ",
      //                     style: TextStyle(
      //                       fontSize: kFontSize,
      //                       fontWeight: FontWeight.bold,
      //                       color: bGreen,
      //                     ),
      //                   );
      //                 },
      //               ),
      //             ),
      //             DashLineSeparator(
      //               color: nGray6,
      //               height: 0.5,
      //             ),
      //             ListTile(
      //               contentPadding: EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: 8),
      //               minLeadingWidth: 0,
      //               leading: IconSticker(
      //                 color: stickerBackgroundColor,
      //                 imageLink: "assets/icons/wallet-check.png",
      //                 backgroundColor: kSecondaryColor,
      //                 iconSize: 60,
      //               ),
      //               title: Text(
      //                 "Qua ví đầu tư",
      //                 style: TextStyle(
      //                   fontSize: kFontSize,
      //                   fontWeight: FontWeight.bold,
      //                   color: kSecondaryColor,
      //                 ),
      //               ),
      //               trailing: BlocBuilder<WalletTransactionOverviewCubit, WalletTransactionOverviewState>(
      //                 builder: (context, state) {
      //                   var totalCashOut = 0.0;
      //                   if (state.status != WalletTransactionOverviewStatus.loading &&
      //                       state.walletTransactionOfTempWallet.length > 0) {
      //                     final cashOutTransactions =
      //                         state.walletTransactionOfTempWallet.where((e) => e.type == "CASH_OUT");
      //                     if (cashOutTransactions.length > 0)
      //                       totalCashOut = cashOutTransactions
      //                           .map((e) => e.amount)
      //                           .whereType<double>()
      //                           .toList()
      //                           .reduce((a, b) => a + b);
      //                   }
      //                   return Text(
      //                     "- ${formatter.format(totalCashOut)} đ",
      //                     style: TextStyle(
      //                       fontSize: kFontSize,
      //                       fontWeight: FontWeight.bold,
      //                       color: kSecondaryColor,
      //                     ),
      //                   );
      //                 },
      //               ),
      //             ),
      //             DashLineSeparator(
      //               color: nGray6,
      //               height: 0.5,
      //             ),
      //             ListTile(
      //               contentPadding: EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: 8),
      //               minLeadingWidth: 0,
      //               leading: IconSticker(
      //                 color: stickerBackgroundColor,
      //                 imageLink: "assets/icons/wallet-check.png",
      //                 backgroundColor: bGreen,
      //                 iconSize: 60,
      //               ),
      //               title: Text(
      //                 "Tạo lệnh rút",
      //                 style: TextStyle(
      //                   fontSize: kFontSize,
      //                   fontWeight: FontWeight.bold,
      //                   color: bGreen,
      //                 ),
      //               ),
      //               trailing: BlocBuilder<WalletTransactionOverviewCubit, WalletTransactionOverviewState>(
      //                 builder: (context, state) {
      //                   var totalCashIn = 0.0;
      //                   if (state.status != WalletTransactionOverviewStatus.loading &&
      //                       state.walletTransactionOfTempWallet.length > 0) {
      //                     final cashInTransactions =
      //                         state.walletTransactionOfTempWallet.where((e) => e.type == "CASH_IN");
      //                     if (cashInTransactions.length > 0)
      //                       totalCashIn = cashInTransactions
      //                           .map((e) => e.amount)
      //                           .whereType<double>()
      //                           .toList()
      //                           .reduce((a, b) => a + b);
      //                   }
      //                   return Text(
      //                     "+ ${formatter.format(totalCashIn)} đ",
      //                     style: TextStyle(
      //                       fontSize: kFontSize,
      //                       fontWeight: FontWeight.bold,
      //                       color: bGreen,
      //                     ),
      //                   );
      //                 },
      //               ),
      //             ),
      //             DashLineSeparator(
      //               color: nGray6,
      //               height: 0.5,
      //             ),
      //             ListTile(
      //               contentPadding: EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: 8),
      //               minLeadingWidth: 0,
      //               leading: IconSticker(
      //                 color: stickerBackgroundColor,
      //                 imageLink: "assets/icons/arrow-left.png",
      //                 backgroundColor: kSecondaryColor,
      //                 iconSize: 60,
      //               ),
      //               title: Text(
      //                 "Rút tiền",
      //                 style: TextStyle(
      //                   fontSize: kFontSize,
      //                   fontWeight: FontWeight.bold,
      //                   color: kSecondaryColor,
      //                 ),
      //               ),
      //               trailing: BlocBuilder<WalletTransactionOverviewCubit, WalletTransactionOverviewState>(
      //                 builder: (context, state) {
      //                   var totalWithdraw = 0.0;
      //                   if (state.status != WalletTransactionOverviewStatus.loading &&
      //                       state.walletTransactionOfTempWallet.length > 0) {
      //                     final withDrawTransactions =
      //                         state.walletTransactionOfTempWallet.where((e) => e.type == "WITHDRAW");
      //                     if (withDrawTransactions.length > 0)
      //                       totalWithdraw = withDrawTransactions
      //                           .map((e) => e.amount)
      //                           .whereType<double>()
      //                           .toList()
      //                           .reduce((a, b) => a + b);
      //                   }
      //                   return Text(
      //                     "- ${formatter.format(totalWithdraw)} đ",
      //                     style: TextStyle(
      //                       fontSize: kFontSize,
      //                       fontWeight: FontWeight.bold,
      //                       color: kSecondaryColor,
      //                     ),
      //                   );
      //                 },
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   );
      case WALLET_TYPE.I2_INVESTMENT_WALLET:
        return Column(
          children: [
            DashLineSeparator(
              color: nWhite,
              height: 0.5,
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultPadding - 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ButtonWallet(
                    icon: "assets/icons/add.png",
                    label: l10n.topUp,
                    onPressed: () => Navigator.pushNamed(context, topupRoute),
                  ),
                  ButtonWallet(
                    icon: "assets/icons/minus.png",
                    label: l10n.withDraw,
                    onPressed: () => Navigator.pushNamed(context, withdrawRoute,
                        arguments: WALLET_TYPE.I2_INVESTMENT_WALLET),
                  ),
                ],
              ),
            ),
          ],
        );
      case WALLET_TYPE.I4_PROJECT_PAYMENT_FOR_BACKER_WALLET:
        return Column(
          children: [
            DashLineSeparator(
              color: nWhite,
              height: 0.5,
            ),
            SizedBox(
              height: 1.5.h,
            ),
            ButtonWallet(
              icon: "assets/icons/transfer.png",
              label: "${l10n.transfer} sang ví thu tiền",
              onPressed: () => Navigator.pushNamed(context, transferRoute),
            ),
          ],
        );
      case WALLET_TYPE.I5_WITHDRAW_WALLET:
        return Column(
          children: [
            DashLineSeparator(
              color: nWhite,
              height: 0.5,
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultPadding - 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ButtonWallet(
                    icon: "assets/icons/minus.png",
                    label: l10n.withDraw,
                    onPressed: () => Navigator.pushNamed(
                      context,
                      withdrawRoute,
                      arguments: WALLET_TYPE.I5_WITHDRAW_WALLET,
                    ),
                  ),
                  ButtonWallet(
                    icon: "assets/icons/transfer.png",
                    label: "${l10n.transfer} sang ví đầu tư",
                    onPressed: () =>
                        Navigator.pushNamed(context, transferRoute),
                  ),
                ],
              ),
            ),
          ],
        );
      default:
        return Container();
    }
  }
}
