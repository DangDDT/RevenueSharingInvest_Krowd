import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/models/models.dart';
import 'package:rsi/ui/_common/loading/circular_loading.dart';
import 'package:rsi/ui/_common/loading/shimmer_loading.dart';
import 'package:sizer/sizer.dart';

import 'project_card_item.dart';

class ProjectListView extends StatelessWidget {
  final ScrollController scroll;

  const ProjectListView({Key? key, required this.scroll}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: BlocBuilder<FetchInvestProjectCubit, FetchInvestProjectState>(
        builder: (context, state) {
          if (state.numOfProject == 0) {
            return Container(
              padding: EdgeInsets.only(bottom: 5.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    EMPTY_IMAGE,
                    width: 250,
                    height: 250,
                  ),
                  Center(
                    child: Text(
                      'Hiện không có dự án nào thuộc lĩnh vực này',
                      style: TextStyle(fontSize: kFontSize),
                    ),
                  ),
                ],
              ),
            );
          }
          if ((state.status == FetchInvestProjectStatus.loading &&
              state.isFirstFetch!)) {
            return ShimmerWidget.rectangular(
              height: 600,
              shapeBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kBorder),
              ),
            );
          }
          List<BasicProject> projects =
              List<BasicProject>.empty(growable: true);
          bool isLoading = false;
          if (state.projects!.length == state.numOfProject) {
            projects = state.oldProjects!;
            isLoading = false;
          } else if (state.status == FetchInvestProjectStatus.loading) {
            projects = state.oldProjects!;
            isLoading = true;
          } else if (state.status == FetchInvestProjectStatus.success) {
            projects = state.projects!;
          }
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              if (index < projects.length &&
                  projects.length <= state.numOfProject!.toInt()) {
                return ProjectCardItem(
                  project: projects[index],
                );
              } else {
                Timer(Duration(microseconds: 30), () {
                  scroll.jumpTo(scroll.position.maxScrollExtent);
                });
                return CircularLoading();
              }
            },
            itemCount: projects.length + (isLoading ? 1 : 0),
          );
        },
      ),
    );
  }
}
