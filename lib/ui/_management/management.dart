import 'package:flutter/material.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/l10n/support_locale.dart';
import 'package:rsi/ui/_management/widgets/investment_history_layout/investment_history_layout.dart';
import 'package:rsi/ui/_management/widgets/withdraw_request_layout/withdraw_request_layout.dart';
import 'package:sizer/sizer.dart';

import 'widgets/account_transaction_layout/account_transaction_layout.dart';
import 'widgets/overview_layout/overview_layout.dart';

class ManagementScreen extends StatefulWidget {
  const ManagementScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ManagementScreen> createState() => _ManagementScreenState();
}

class _ManagementScreenState extends State<ManagementScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  List<String> _listTabName = [
    "Tổng quan",
    "Lịch sử đầu tư",
    "Lệnh rút tiền",
    "Lịch sử nạp/rút tiền"
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _listTabName.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.useL10n();
    return Scaffold(
      backgroundColor: nWhite,
      appBar: appBar(l10n, context),
      body: TabBarView(
        controller: _tabController,
        children: [
          OverViewLayout(),
          InvestmentHistoryLayout(),
          WithdrawRequestLayout(),
          AccountTransactionLayout(),
        ],
      ),
    );
  }

  List<Tab> buildManagementTabBar(List<String> tabNames) {
    return tabNames
        .map(
          (_tabName) => Tab(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  _tabName,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        )
        .toList();
  }

  AppBar appBar(l10n, BuildContext context) {
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
            tabs: buildManagementTabBar(_listTabName),
            isScrollable: true,
            padding: EdgeInsets.symmetric(horizontal: 0),
          ),
        ),
      ),
    );
  }
}
