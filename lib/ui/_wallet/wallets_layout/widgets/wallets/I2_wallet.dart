// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/l10n/support_locale.dart';
import 'package:rsi/ui/_common/loading/shimmer_loading.dart';
import 'package:rsi/ui/_common/pull_refresh.dart';
import 'package:rsi/ui/_wallet/wallets_layout/widgets/wallet_transaction_view.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart' as intl;

import '../wallet_card.dart';

class I2_Wallet extends StatelessWidget {
  const I2_Wallet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatter = intl.NumberFormat.decimalPattern();
    final l10n = L10n.useL10n();
    return BlocBuilder<WalletCubit, WalletState>(
      builder: (context, state) {
        if (state.status == WalletStatus.loading)
          return ShimmerWidget.rectangular(
            height: 20.h,
            shapeBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kBorder),
            ),
          );
        else if (state.status == WalletStatus.success) {
          final investmentWallet = state.walletList[1];
          return PullRefresh(
            action: () => context.read<WalletCubit>().loadWallets(),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Column(
                children: [
                  WalletCard(
                    backgroundColor: kPrimaryColor,
                    stickerIconColor: kPrimaryColor,
                    stickerLink: "assets/icons/wallet-add.png",
                    title: l10n.investmentWallet,
                    subtitle: "${formatter.format(investmentWallet.balance)} đ",
                    stickerBackgroundColor: nWhite,
                    walletType: WALLET_TYPE.I2_INVESTMENT_WALLET,
                  ),
                  WalletTransactionView(currentWalletState: investmentWallet),
                ],
              ),
            ),
          );
        } else {
          return ShimmerWidget.rectangular(
            height: 20.h,
            shapeBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kBorder),
            ),
          );
        }
      },
    );
  }
}
