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

class I1_Wallet extends StatefulWidget {
  const I1_Wallet({
    Key? key,
  }) : super(key: key);

  @override
  State<I1_Wallet> createState() => _I1_WalletState();
}

class _I1_WalletState extends State<I1_Wallet> {
  @override
  void initState() {
    context
        .read<WalletTransactionOverviewCubit>()
        .fetchAllWalletTransactionTempWallet();
    super.initState();
  }

  Future pullRefresh() async {
    context.read<WalletCubit>().loadWallets();
    context
        .read<WalletTransactionOverviewCubit>()
        .fetchAllWalletTransactionTempWallet();
  }

  @override
  Widget build(BuildContext context) {
    final formatter = intl.NumberFormat.decimalPattern();
    final l10n = L10n.useL10n();
    return BlocBuilder<WalletCubit, WalletState>(builder: (context, state) {
      if (state.status == WalletStatus.loading)
        return ShimmerWidget.rectangular(
          height: 15.h,
          shapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorder),
          ),
          hasMargin: false,
        );
      else if (state.status == WalletStatus.success) {
        final tempWallet = state.walletList[0];
        return PullRefresh(
          action: () => pullRefresh(),
          child: SingleChildScrollView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            child: Column(
              children: [
                WalletCard(
                  backgroundColor: kPrimaryColor,
                  stickerIconColor: kPrimaryColor,
                  stickerLink: "assets/icons/empty-wallet-time.png",
                  title: l10n.tempWallet,
                  subtitle: "${formatter.format(tempWallet.balance)} đ",
                  stickerBackgroundColor: nWhite,
                  walletType: WALLET_TYPE.I1_TEMP_WALLET,
                ),
                WalletTransactionView(currentWalletState: tempWallet),
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
    });
  }
}
