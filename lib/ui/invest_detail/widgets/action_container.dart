import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/cubit/project/project_detail/fetch_project_detail_cubit.dart';
import 'package:rsi/foundation/constants.dart';
import 'action_item.dart';

class ActionContainer extends StatelessWidget {
  const ActionContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final project =
        context.read<FetchProjectDetailCubit>().state.projectDetailById!;
    final projectEntity = project.projectEntity!;
    final updatedsOfProject = projectEntity
        .firstWhere((value) => value.type == "UPDATE")
        .typeItemList;

    return Container(
      decoration: new BoxDecoration(
        color: nWhite,
        borderRadius: BorderRadius.circular(kBorder),
        boxShadow: kBoxShadow,
      ),
      child: ActionItem(
        iconLink: 'assets/icons/document.png',
        onPressed: () {},
        title: 'Cập nhật',
        trailingNumber:
            updatedsOfProject != null ? updatedsOfProject.length : 0,
      ),
    );
  }
}
