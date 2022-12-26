import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';

class ViewModeTabbar extends StatelessWidget {
  const ViewModeTabbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leadingWidth: 0,
      elevation: 0,
      titleSpacing: 0,
      backgroundColor: Colors.white,
      title: DefaultTabController(
        length: 2,
        child: TabBar(
          onTap: (value) =>
              context.read<StageCubit>().onChangeCurrentTab(value),
          unselectedLabelColor: nGray3,
          labelColor: kLightTextColor,
          indicatorSize: TabBarIndicatorSize.label,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: nGray1,
          ),
          tabs: buildStageTabBar(),
          labelPadding: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.symmetric(horizontal: 0),
        ),
      ),
    );
  }
}

List<Tab> buildStageTabBar() {
  return [
    Tab(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Align(
          alignment: Alignment.center,
          child: Image.asset(
            "assets/icons/cards.png",
            width: 20,
          ),
        ),
      ),
    ),
    Tab(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Align(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/icons/chart-square.png",
              width: 20,
            )),
      ),
    ),
  ];
}
