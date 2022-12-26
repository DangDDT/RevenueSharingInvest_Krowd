import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/models/models.dart';
import 'package:rsi/ui/_common/loading/circular_loading.dart';
import 'package:rsi/ui/_common/loading/shimmer_loading.dart';
import 'package:rsi/ui/invest_detail/widgets/pitchs/pitch_view/pitch_view.dart';

class Pitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchProjectDetailCubit, FetchProjectDetailState>(
      builder: (BuildContext _, state) {
        if (state.status == FetchProjectDetailStatus.loading)
          return CircularLoading();
        if (state.status == FetchProjectDetailStatus.success) {
          final project =
              context.read<FetchProjectDetailCubit>().state.projectDetailById!;
          final projectEntity = project.projectEntity!;
          final pitchs = projectEntity
              .firstWhere((value) => value.type == "PITCH")
              .typeItemList;
          if (pitchs == null || pitchs.length == 0)
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    EMPTY_IMAGE,
                    width: 300,
                    height: 300,
                  ),
                  Center(
                      child: Text('Chưa cập nhật nội dung',
                          style: TextStyle(fontSize: kFontSize))),
                ],
              ),
            );
          else {
            return Container(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    leadingWidth: 0,
                    titleSpacing: 0,
                    backgroundColor: Colors.white,
                    pinned: false,
                    snap: true,
                    floating: true,
                    title: DefaultTabController(
                      length: pitchs.length,
                      initialIndex:
                          state.pitchIds!.indexOf(state.currentPitch!.id),
                      child: TabBar(
                        onTap: (value) => context
                            .read<FetchProjectDetailCubit>()
                            .fetchPitch(state.pitchIds!.elementAt(value)!),
                        unselectedLabelColor: nGray3,
                        unselectedLabelStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: kFontSize - 4),
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: kFontSize - 2),
                        labelColor: kSecondaryColor,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: BoxDecoration(
                          color: nWhite,
                        ),
                        tabs: buildPitchsTabBar(pitchs),
                        isScrollable: true,
                        labelPadding: EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.symmetric(horizontal: 0),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: PitchView(),
                  )
                ],
              ),
            );
          }
        }
        return ShimmerWidget.rectangular(
          shapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorder),
          ),
        );
      },
    );
  }
}

List<Tab> buildPitchsTabBar(List<TypeItemList> pitchs) {
  return pitchs
      .map(
        (pitch) => Tab(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                pitch.title!,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      )
      .toList();
}
