// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:sizer/sizer.dart';

import 'wallets_layout/widgets/wallets/I1_wallet.dart';
import 'wallets_layout/widgets/wallets/I2_wallet.dart';
import 'wallets_layout/widgets/wallets/I3_wallet.dart';
import 'wallets_layout/widgets/wallets/I4_wallet.dart';
import 'wallets_layout/widgets/wallets/I5_wallet.dart';

class WalletsScreen extends StatefulWidget {
  const WalletsScreen({Key? key}) : super(key: key);

  @override
  State<WalletsScreen> createState() => _WalletsScreenState();
}

class _WalletsScreenState extends State<WalletsScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  List<String> _listTabName = [
    "Ví tạm thời",
    "Ví đầu tư chung",
    "Ví tạm ứng",
    "Ví dự án",
    "Ví thu tiền"
  ];
  void _loadData() {
    context.read<WalletCubit>().loadWallets();
  }

  @override
  void initState() {
    _loadData();
    _tabController = TabController(length: _listTabName.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: nWhite,
      appBar: appBar(),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          I1_Wallet(),
          I2_Wallet(),
          I3_Wallet(),
          I4_Wallet(),
          I5_Wallet(),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: nWhite,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(12),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          color: nWhite,
          width: 100.w,
          child: TabBar(
            onTap: (index) =>
                context.read<WalletCubit>().onChangeWalletView(index),
            unselectedLabelColor: nGray3,
            labelColor: kPrimaryColor,
            unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.normal, fontSize: kFontSize - 2),
            labelStyle:
                TextStyle(fontWeight: FontWeight.bold, fontSize: kFontSize),
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
              color: nWhite,
            ),
            controller: _tabController,
            tabs: buildWalletTabBar(_listTabName),
            isScrollable: true,
            padding: EdgeInsets.symmetric(horizontal: 0),
          ),
        ),
      ),
    );
  }

  List<Tab> buildWalletTabBar(List<String> walletNames) {
    return walletNames
        .map(
          (_walletName) => Tab(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  _walletName.toString(),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        )
        .toList();
  }
}
