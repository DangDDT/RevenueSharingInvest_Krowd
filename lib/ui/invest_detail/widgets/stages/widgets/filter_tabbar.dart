import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/ui/_common/loading/shimmer_loading.dart';

class FilterTabbar extends StatelessWidget {
  const FilterTabbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StageCubit, StageState>(builder: (context, state) {
      if (state.currentTab == StageTab.CARD) {
        if (state.status == StageStatus.loading ||
            state.status == StageStatus.failure) {
          return SliverToBoxAdapter(
              child: ShimmerWidget.rectangular(height: 50));
        } else {
          return SliverAppBar(
            leadingWidth: 0,
            elevation: 0,
            titleSpacing: 0,
            backgroundColor: Colors.white,
            floating: true,
            title: DefaultTabController(
              length: state.listFilter.length,
              child: TabBar(
                onTap: (value) => context
                    .read<StageCubit>()
                    .onUseFilterStage(state.listFilterInt[value]),
                unselectedLabelColor: kGrayBy6,
                labelColor: kSecondaryColor,
                unselectedLabelStyle: TextStyle(
                    fontSize: kFontSize - 4, fontWeight: FontWeight.normal),
                labelStyle: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: kFontSize - 2),
                isScrollable: state.listFilter.length > 3,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                  color: nWhite,
                ),
                tabs: buildStageFilterList(state.listFilter),
                labelPadding: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.symmetric(horizontal: 0),
              ),
            ),
          );
        }
      } else if (state.currentTab == StageTab.CHART)
        return SliverToBoxAdapter(child: Container());
      else
        return SliverToBoxAdapter(child: Container());
    });
  }
}

List<Tab> buildStageFilterList(List<String> filterList) {
  return filterList
      .map(
        (filterItem) => Tab(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  filterItem,
                  textAlign: TextAlign.center,
                )),
          ),
        ),
      )
      .toList();
}
