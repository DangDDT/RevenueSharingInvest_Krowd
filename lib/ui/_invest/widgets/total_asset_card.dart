import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl;
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/router/router_constants.dart';
import 'package:rsi/ui/_common/loading/shimmer_loading.dart';

class TotalAssetCard extends StatelessWidget {
  const TotalAssetCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatter = intl.NumberFormat.decimalPattern();
    return Container(
      padding:
          EdgeInsets.only(left: 10, right: 10, top: 0, bottom: kDefaultPadding),
      decoration: BoxDecoration(
        color: kPrimaryColor,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: nWhite,
          borderRadius: BorderRadius.circular(kBorder),
          boxShadow: kBoxShadow,
        ),
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: 10),
          tileColor: kLightTextColor,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Số dư ví đầu tư:",
              style:
                  TextStyle(fontSize: kFontSize, fontWeight: FontWeight.bold),
            ),
          ),
          subtitle: BlocBuilder<WalletCubit, WalletState>(
            builder: (context, state) {
              if (state.status == WalletStatus.loading ||
                  state.walletList.length == 0) {
                return ShimmerWidget.rectangular(height: 30, hasMargin: false);
              } else {
                final balance = state.walletList[1].balance!;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "${formatter.format(balance)}đ",
                        style: TextStyle(
                          fontSize: kFontSize + 2,
                          color: kSecondaryColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width: 5),
                      InkWell(
                        onTap: () => context.read<WalletCubit>()..loadWallets(),
                        child: Icon(
                          Icons.loop,
                          color: nGray5,
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
          trailing: BlocBuilder<WalletCubit, WalletState>(
            builder: (context, state) {
              if (state.status == WalletStatus.loading ||
                  state.status == WalletStatus.failure) {
                return ElevatedButton.icon(
                  icon: Icon(
                    Icons.add,
                    size: 15,
                  ),
                  label: Text(
                    "Nạp tiền",
                    style: TextStyle(fontSize: kFontSize - 2),
                  ),
                  onPressed: null,
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(100, 20),
                    backgroundColor: kSecondaryColor,
                    padding: EdgeInsets.symmetric(horizontal: 0),
                  ),
                );
              } else {
                final balance = state.walletList[1].balance!;
                return ElevatedButton.icon(
                  icon: Icon(
                    Icons.add,
                    size: 15,
                  ),
                  label: Text(
                    "Nạp tiền",
                    style: TextStyle(fontSize: kFontSize - 2),
                  ),
                  onPressed: () => onTopup(context, balance),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(100, 20),
                    backgroundColor: kSecondaryColor,
                    padding: EdgeInsets.symmetric(horizontal: 0),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  void onTopup(context, balance) => Navigator.pushNamed(context, topupRoute);
}
