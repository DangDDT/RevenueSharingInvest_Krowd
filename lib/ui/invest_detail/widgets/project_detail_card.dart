import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/l10n/support_locale.dart';
import 'package:rsi/ui/_common/loading/shimmer_loading.dart';
import 'package:sizer/sizer.dart';

import 'tab_views/highlight_tab_view.dart';
import 'tab_views/manager_tab_view.dart';
import 'tab_views/overview_tab_view.dart';

class ProjectDetailCard extends StatefulWidget {
  const ProjectDetailCard({
    Key? key,
  }) : super(key: key);
  @override
  State<ProjectDetailCard> createState() => _ProjectDetailCardState();
}

class _ProjectDetailCardState extends State<ProjectDetailCard> {
  var _listTabBar, _currentTabView, _currentIndexTabView;

  void _onChangeTab(value) {
    setState(() {
      _currentIndexTabView = value;
      _currentTabView = _renderCurrentTabView();
    });
  }

  void _usel10n() {
    var localeProvider = context.read<LocaleProvider>();
    _listTabBar = L10n.getListTabBar(localeProvider)
        .map((title) => Tab(text: title))
        .toList();
  }

  Widget _renderCurrentTabView() {
    return BlocBuilder<FetchProjectDetailCubit, FetchProjectDetailState>(
      builder: (context, state) {
        if (state.status == FetchProjectDetailStatus.success) {
          return Builder(builder: (context) {
            switch (_currentIndexTabView) {
              case 0:
                return OverviewTabView();

              case 1:
                return HighlightTabView();

              case 2:
                return ManagerTabView();
              default:
                return Container(
                  child: Center(child: Text("$_currentIndexTabView")),
                );
            }
          });
        }
        return ShimmerWidget.rectangular(
          shapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorder),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    _usel10n();
    _currentIndexTabView = 0;
    _currentTabView = _renderCurrentTabView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var tabBar = DefaultTabController(
      initialIndex: 0,
      length: _listTabBar.length,
      child: TabBar(
        padding: EdgeInsets.symmetric(vertical: kDefaultPadding - 15),
        tabs: _listTabBar,
        labelColor: kSecondaryColor,
        unselectedLabelColor: kDarkTextColor,
        indicatorColor: kSecondaryColor,
        onTap: _onChangeTab,
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle:
            TextStyle(fontSize: kFontSize - 2, fontWeight: FontWeight.bold),
        isScrollable: false,
      ),
    );

    return BlocBuilder<FetchProjectDetailCubit, FetchProjectDetailState>(
        builder: (context, state) {
      if (state.status == FetchProjectDetailStatus.success) {
        return Container(
            decoration: BoxDecoration(
              color: nWhite,
              borderRadius: BorderRadius.circular(kBorder),
              boxShadow: kBoxShadow,
            ),
            constraints: BoxConstraints(minHeight: 10.h),
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                tabBar,
                _currentTabView,
              ],
            ));
      }
      return ShimmerWidget.rectangular(
        shapeBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorder),
        ),
      );
    });
  }
}
