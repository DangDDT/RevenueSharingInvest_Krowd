import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/ui/_common/loading/shimmer_loading.dart';

import 'document_button.dart';

class Document extends StatelessWidget {
  const Document({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchProjectDetailCubit, FetchProjectDetailState>(
      builder: (context, state) {
        if (state.status == FetchProjectDetailStatus.loading)
          return ShimmerWidget.rectangular();
        if (state.status == FetchProjectDetailStatus.success) {
          final project =
              context.read<FetchProjectDetailCubit>().state.projectDetailById!;
          final projectEntity = project.projectEntity!;
          final documents = projectEntity
              .firstWhere((value) => value.type == "DOCUMENT")
              .typeItemList;
          if (documents == null || documents.length == 0)
            return Container();
          else {
            return Container(
              margin: EdgeInsets.only(top: kDefaultPadding),
              child: Column(children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Tư liệu tham khảo",
                    style: TextStyle(
                      fontSize: kFontSize + 4,
                      fontWeight: FontWeight.bold,
                      color: kDarkTextColor.withOpacity(.9),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: documents.map((_doc) {
                    // int idx = documentsTitle.indexOf(_pt);
                    return DocumentButton(
                      title: _doc.title.toString(),
                      url: _doc.link.toString(),
                    );
                  }).toList(),
                )
              ]),
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
