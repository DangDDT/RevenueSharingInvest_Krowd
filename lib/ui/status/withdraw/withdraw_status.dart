import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/ui/_common/loading/circular_loading.dart';
import 'package:sizer/sizer.dart';

import 'widgets/withdraw_status_content.dart';

class WithdrawStatusScreen extends StatelessWidget {
  const WithdrawStatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WithdrawRequestCubit, WithdrawRequestState>(
        builder: (context, state) {
          if (state.status == WithdrawRequestStatus.loading) {
            return renderLoading();
          } else if (state.status == WithdrawRequestStatus.success) {
            return renderContent();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

Widget renderContent() {
  return Container(
    padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding, vertical: kDefaultPadding * 3),
    alignment: Alignment.center,
    child: Container(
      width: 100.w,
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: nWhite,
        borderRadius: BorderRadius.circular(kBorder),
        boxShadow: kBoxShadow,
      ),
      child: WithdrawStatusContent(),
    ),
  );
}

Widget renderLoading() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CircularLoading(),
      SizedBox(height: 10),
      Text(
        "Đang xử lý, vui lòng đợi trong giây lát...",
        style: TextStyle(
          fontSize: kFontSize,
          color: kDarkTextColor,
          decoration: TextDecoration.none,
        ),
      ),
    ],
  );
}
