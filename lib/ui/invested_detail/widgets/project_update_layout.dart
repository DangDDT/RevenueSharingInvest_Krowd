import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/ui/_common/loading/circular_loading.dart';
import 'package:rsi/ui/_common/pull_refresh.dart';
import 'package:sizer/sizer.dart';

class ProjectUpdateLayout extends StatefulWidget {
  final String projectId;
  const ProjectUpdateLayout({Key? key, required this.projectId})
      : super(key: key);

  @override
  State<ProjectUpdateLayout> createState() => _ProjectUpdateLayoutState();
}

class _ProjectUpdateLayoutState extends State<ProjectUpdateLayout> {
  Future<void> _loadData() async {
    context.read<ProjectUpdateCubit>()..fetchUpdates(widget.projectId);
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PullRefresh(
      action: () => _loadData(),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: BlocBuilder<ProjectUpdateCubit, ProjectUpdateState>(
          builder: (context, state) {
            switch (state.status) {
              case ProjectUpdateStatus.loading:
                return CircularLoading();
              case ProjectUpdateStatus.success:
                if (state.projectUpdate!.length == 0) {
                  return renderEmpty();
                } else {
                  return renderContent(context, state);
                }
              case ProjectUpdateStatus.failure:
                return renderFailure();
              default:
                return renderFailure();
            }
          },
        ),
      ),
    );
  }

  Widget renderEmpty() {
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
              'Bảng tin dự án sẽ được cập nhật sớm thôi !!!',
              style: TextStyle(fontSize: kFontSize),
            ),
          ),
        ],
      ),
    );
  }

  Widget renderContent(BuildContext context, ProjectUpdateState state) {
    final updates = state.projectUpdate;
    return Container(
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final update = updates!.elementAt(index);
          return Container(
            child: Column(
              children: [
                ListTile(
                  dense: true,
                  minLeadingWidth: 0,
                  leading: Icon(
                    Icons.star,
                    color: kSecondaryColor,
                  ),
                  title: Text(
                    update.updateDate!.split(" ").first,
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: kFontSize,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Html(
                  data: update.content,
                  tagsList: Html.tags,
                  style: HTML_STYLE,
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 0),
        itemCount: state.projectUpdate!.length,
      ),
    );
  }

  Widget renderFailure() {
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
              'Hệ thống đang bảo trì vui lòng thử lại sau !!!',
              style: TextStyle(fontSize: kFontSize),
            ),
          ),
        ],
      ),
    );
  }
}
