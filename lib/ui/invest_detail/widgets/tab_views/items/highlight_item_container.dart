import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:rsi/foundation/constants.dart';

const ENTITY_TYPE = "HIGHLIGHT";
const ENTITY_TITLE = "List";

class HighlightListItem extends StatelessWidget {
  const HighlightListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final project =
          context.read<FetchProjectDetailCubit>().state.projectDetailById!;
      final projectEntity = project.projectEntity!;
      final typeItemList = projectEntity
          .firstWhere((value) => value.type == ENTITY_TYPE)
          .typeItemList;
      if (typeItemList == null || typeItemList.length == 0) {
        return Container(
          padding: EdgeInsets.only(bottom: kDefaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                EMPTY_IMAGE,
                width: 300,
                height: 250,
              ),
              Center(
                child: Text(
                  'Thông tin nổi bật chưa được cập nhật',
                  style: TextStyle(fontSize: kFontSize),
                ),
              ),
            ],
          ),
        );
      } else {
        final highlightList = typeItemList
            .firstWhere((value) => value.title == ENTITY_TITLE)
            .content;
        return Container(
            padding: EdgeInsets.only(right: kDefaultPadding),
            child: Html(
              data: highlightList,
              tagsList: Html.tags,
              style: {
                "li": Style(
                  margin: EdgeInsets.only(bottom: 20),
                  color: kDarkTextColor.withOpacity(0.6),
                  textAlign: TextAlign.justify,
                  listStyleType: ListStyleType.fromWidget(Image.asset(
                    "assets/images/star.png",
                    width: 20,
                  )),
                  listStylePosition: ListStylePosition.INSIDE,
                ),
              },
            ));
      }
    });
  }
}
