import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/ui/_common/loading/circular_loading.dart';
import 'package:rsi/ui/status/cancel_investment/widgets/cancel_investment_status_content.dart';
import 'package:sizer/sizer.dart';

class CancelInvestmentStatusScreen extends StatelessWidget {
  const CancelInvestmentStatusScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<InvestmentCubit, InvestmentState>(
        builder: (context, state) {
          if (state.status == InvestmentStatus.loading) {
            return renderLoading();
          } else if (state.status == InvestmentStatus.success) {
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
      child: CancelInvestmentStatusContent(),
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
