import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'widgets/filter_tabbar.dart';
import 'widgets/stage_description.dart';
import 'widgets/stage_view.dart';

class Stage extends StatefulWidget {
  const Stage({
    Key? key,
  }) : super(key: key);

  @override
  State<Stage> createState() => _StageState();
}

class _StageState extends State<Stage> {
  @override
  void initState() {
    final String projectId =
        context.read<FetchProjectDetailCubit>().state.projectDetailById!.id!;
    context.read<StageCubit>().fetchStageByProjectId(projectId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          renderFilterTabbar(),
          renderStageDescription(),
          renderStageView(),
        ],
      ),
    );
  }
}

Widget renderFilterTabbar() => FilterTabbar();

Widget renderStageDescription() => StageDescription();

Widget renderStageView() => StageView();
