import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/ui/_common/loading/circular_loading.dart';

class PitchView extends StatelessWidget {
  const PitchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchProjectDetailCubit, FetchProjectDetailState>(
      builder: (context, state) {
        if (state.status == FetchProjectDetailStatus.loading)
          return CircularLoading();
        final pitch = state.currentPitch;
        if (state.status == FetchProjectDetailStatus.success &&
            pitch != null &&
            pitch.content != null)
          return Container(
            padding: const EdgeInsets.only(
              right: kDefaultPadding,
              left: kDefaultPadding,
            ),
            child: Html(
              data: pitch.content,
              tagsList: Html.tags,
              style: HTML_STYLE,
            ),
          );
        return Center(
          child: Text("Xảy ra lỗi, mời thử lại !!!"),
        );
      },
    );
  }
}
