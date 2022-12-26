import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/style.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/ui/_common/loading/shimmer_loading.dart';
import 'package:rsi/ui/invest_detail/widgets/others/members/member_item_container.dart';
import 'package:sizer/sizer.dart';

class MemberViewWidget extends StatelessWidget {
  const MemberViewWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Column(
        children: [
          Container(
            child: Text(
              'Danh sách nhà đầu tư',
              style: TextStyle(
                fontSize: FontSize.xLarge.size,
                fontWeight: FontWeight.bold,
                color: kDarkTextColor.withOpacity(.9),
              ),
            ),
          ),
          memberListWidget(context)
        ],
      ),
    );
  }
}

Widget memberListWidget(context) {
  return BlocBuilder<FetchProjectDetailCubit, FetchProjectDetailState>(
      builder: (BuildContext context, state) {
    if (state.status == FetchProjectDetailStatus.loading)
      return ShimmerWidget.rectangular();
    if (state.status == FetchProjectDetailStatus.success) {
      final project =
          context.read<FetchProjectDetailCubit>().state.projectDetailById!;
      final memberList = project.memberList!;
      if (memberList.length == 0)
        return Container(
          decoration: BoxDecoration(
            color: nWhite,
            borderRadius: BorderRadius.circular(kBorder),
            boxShadow: kBoxShadow,
          ),
          padding: EdgeInsets.only(bottom: kDefaultPadding),
          margin: EdgeInsets.only(top: kDefaultPadding),
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
                  'Hiện chưa có nhà đầu tư tham gia dự án',
                  style: TextStyle(fontSize: kFontSize),
                ),
              ),
            ],
          ),
        );
      return Container(
        decoration: BoxDecoration(
          color: nWhite,
          borderRadius: BorderRadius.circular(kBorder),
          boxShadow: kBoxShadow,
        ),
        padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
        margin: EdgeInsets.only(top: kDefaultPadding),
        constraints: BoxConstraints(maxHeight: 45.h),
        child: ListView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          shrinkWrap: true,
          children: memberList
              .map((member) => MemberContainerItem(
                    memberImageLink: member.image.toString(),
                    memberName:
                        "${member.firstName} ${member.lastName}".toString(),
                  ))
              .toList(),
        ),
      );
    }
    return ShimmerWidget.rectangular(
        shapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorder)));
  });
}
