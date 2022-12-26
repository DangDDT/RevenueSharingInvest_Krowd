import 'package:flutter/material.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/ui/invested_detail/widgets/overview_invest_layout.dart';
import 'package:rsi/ui/invested_detail/widgets/project_update_layout.dart';
import 'package:rsi/ui/invested_detail/widgets/stage_return_layout.dart';
import 'package:sizer/sizer.dart';

import 'widgets/report_revenue_layout.dart';

class InvestedActiveDetailScreen extends StatefulWidget {
  final String projectId;
  const InvestedActiveDetailScreen({Key? key, required this.projectId})
      : super(key: key);

  @override
  State<InvestedActiveDetailScreen> createState() =>
      _InvestedActiveDetailScreenState();
}

class _InvestedActiveDetailScreenState extends State<InvestedActiveDetailScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late List<String> _listTabName = [
    "Tổng quan đầu tư",
    "Giai đoạn thanh toán",
    "Báo cáo doanh thu",
    "Bản tin dự án",
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _listTabName.length, vsync: this);
  }

  List<Tab> buildManagementTabBar(List<String> tabNames) {
    return tabNames
        .map(
          (_tabName) => Tab(
            child: Container(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sổ tay đầu tư",
          style: TextStyle(
            color: kLightTextColor,
            fontSize: kFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: nWhite,
            height: 60.0,
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
                borderRadius: BorderRadius.circular(8),
                color: nWhite,
              ),
              controller: _tabController,
              tabs: buildManagementTabBar(_listTabName),
              isScrollable: true,
              padding: EdgeInsets.symmetric(horizontal: 0),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          OverviewInvestLayout(projectId: widget.projectId),
          StageReturnLayout(projectId: widget.projectId),
          ReportRevenueLayout(projectId: widget.projectId),
          ProjectUpdateLayout(projectId: widget.projectId),
        ],
      ),
    );
  }
}
