// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/l10n/support_locale.dart';
import 'package:rsi/ui/_common/buttons/secondary_button.dart';
import 'package:rsi/ui/_common/loading/shimmer_loading.dart';
import 'package:rsi/ui/_common/pull_refresh.dart';
import 'package:rsi/ui/invest_detail/widgets/others/other.dart';
import 'package:rsi/ui/invest_detail/widgets/pitchs/pitch.dart';
import 'package:rsi/ui/invest_detail/widgets/question_modal.dart';
import 'package:rsi/ui/invest_detail/widgets/stages/stage.dart';
import 'package:sizer/sizer.dart';
import 'widgets/packages_modal/packages_modal.dart';
import 'widgets/project_card.dart';
import 'widgets/project_detail_card.dart';

class InvestDetailScreen extends StatefulWidget {
  final String projectId;
  const InvestDetailScreen({Key? key, required this.projectId})
      : super(key: key);
  @override
  State<InvestDetailScreen> createState() => _InvestDetailScreenState();
}

class _InvestDetailScreenState extends State<InvestDetailScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  List<String> _listTabName = ["Tổng quan", "Tiêu điểm", "Giai đoạn", "Khác"];
  void _loadData() {
    final projectId = widget.projectId;
    context.read<FetchProjectDetailCubit>()
      ..init()
      ..fetchProjectDetail(projectId);
    context.read<StageCubit>().init(projectId);
  }

  @override
  void initState() {
    super.initState();
    _loadData();
    _tabController = TabController(vsync: this, length: _listTabName.length);
  }

  @override
  void dispose() {
    super.dispose();
  }

  // ignore: unused_element
  Future<void> _pullRefresh() async {
    await context.read<FetchProjectDetailCubit>().pullRefresh();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.useL10n();
    Widget overviewContainer = PullRefresh(
      action: () => context.read<FetchProjectDetailCubit>().pullRefresh(),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        padding: EdgeInsets.only(
          left: kDefaultPadding,
          right: kDefaultPadding,
          bottom: kDefaultPadding,
        ),
        child: Container(
          child: Column(
            children: <Widget>[
              headerWidget(),
              ProjectDetailCard(),
            ],
          ),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: appBar(l10n, context),
      body: TabBarView(
        controller: _tabController,
        children: [
          overviewContainer,
          Pitch(),
          Stage(),
          OtherTabView(),
        ],
      ),
      bottomNavigationBar: bottomBarWidget(l10n, context),
    );
  }

  AppBar appBar(AppLocalizations l10n, BuildContext context) {
    void _onPop() => Navigator.pop(context);
    return AppBar(
      leading: IconButton(
        icon: Icon(BACKWARD_ICON, color: kBackgroundColor),
        onPressed: _onPop,
      ),
      title: Text(
        l10n.detail,
        style: TextStyle(
          color: kLightTextColor,
          fontSize: kFontSize + 2,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevation: 0,
      centerTitle: true,
      backgroundColor: kPrimaryColor,
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
      actions: <Widget>[
        IconButton(
          onPressed: () => showQuestionModal(context),
          icon: Image.asset(
            "assets/icons/message-question-solid.png",
            color: kBackgroundColor,
          ),
        )
      ],
    );
  }

  Widget headerWidget() =>
      BlocBuilder<FetchProjectDetailCubit, FetchProjectDetailState>(
        builder: (context, state) {
          if (state.status == FetchProjectDetailStatus.success) {
            return Container(child: ProjectCard());
          }
          return ShimmerWidget.rectangular(
            shapeBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kBorder),
            ),
          );
        },
      );

  Widget bottomBarWidget(AppLocalizations l10n, context) {
    return BlocBuilder<FetchProjectDetailCubit, FetchProjectDetailState>(
      builder: (context, state) {
        return Container(
          height: 10.h + 10,
          color: nWhite,
          child: Padding(
            padding: EdgeInsets.all(kDefaultPadding - 5),
            child: SecondaryButton(
              enabled: state.projectDetailById != null,
              onPress: () => showPackageModal(
                  context, "Chọn gói", state.projectDetailById!),
              title: l10n.investNow,
            ),
          ),
        );
      },
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
}
