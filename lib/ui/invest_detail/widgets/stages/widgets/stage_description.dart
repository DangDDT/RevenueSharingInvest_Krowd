import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/cubit/stage/stage_cubit.dart';
import 'package:rsi/foundation/constants.dart';

class StageDescription extends StatelessWidget {
  const StageDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StageCubit, StageState>(
      builder: (context, state) {
        if (state.currentTab == StageTab.CARD ||
            state.currentTab == StageTab.CHART) {
          return SliverAppBar(
            leadingWidth: 0,
            elevation: 0,
            titleSpacing: 0,
            backgroundColor: nWhite,
            pinned: true,
            title: Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Chip(
                      avatar: Icon(
                        Icons.circle,
                        color: bIndigo,
                      ),
                      backgroundColor: kSecondaryColor.withOpacity(.1),
                      label: Text("Thấp nhất",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: kFontSize - 4)),
                    ),
                  ),
                  Expanded(
                    child: Chip(
                      avatar: Icon(
                        Icons.circle,
                        color: bYellow,
                      ),
                      backgroundColor: kSecondaryColor.withOpacity(.1),
                      label: Text("Trung bình",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: kFontSize - 4)),
                    ),
                  ),
                  Expanded(
                    child: Chip(
                      avatar: Icon(
                        Icons.circle,
                        color: kPrimaryColor,
                      ),
                      backgroundColor: kSecondaryColor.withOpacity(.1),
                      label: Text("Cao nhất",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: kFontSize - 4)),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else
          return SliverToBoxAdapter(child: Container());
      },
    );
  }
}
