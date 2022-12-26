import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/cubit/cart/cart_cubit.dart';
import 'package:rsi/blocs/cubit/investment/investment_cubit.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/ui/_common/buttons/primary_button.dart';
import 'package:rsi/ui/_common/dashline_separator.dart';
import 'package:rsi/ui/_common/icon_sticker.dart';
import 'package:rsi/ui/_common/loading/circular_loading.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart' as intl;
import 'widgets/investment_status_content.dart';

class InvestmentStatusScreen extends StatelessWidget {
  const InvestmentStatusScreen({
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
            return renderFailure();
          }
        },
      ),
    );
  }

  Widget renderFailure() {
    final formatter = intl.NumberFormat.decimalPattern();
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: IconSticker(
                    color: nWhite,
                    icon: CupertinoIcons.multiply,
                    backgroundColor: bRed,
                    iconSize: 70,
                    shapeSize: 80,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
                  child: Text(
                    "Giao dịch thất bại",
                    style: TextStyle(fontSize: kFontSize + 4),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    "Đầu tư thất bại gói ${state.selectedPackage!.name}",
                    style: TextStyle(fontSize: kFontSize, color: nGray6),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "${formatter.format(state.totalPrice)} đ",
                    style: TextStyle(
                      fontSize: kFontSize + 18,
                      color: bRed,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DashLineSeparator(
                  color: nGray6,
                  height: 0.5,
                ),
                Container(
                  margin: EdgeInsets.only(top: kDefaultPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ListTile(
                        dense: true,
                        horizontalTitleGap: 10,
                        title: Text(
                          'Dự án:',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: kDarkTextColor,
                            fontSize: kFontSize,
                          ),
                        ),
                        trailing: Text(
                          state.selectedProject!.name.toString(),
                          style: TextStyle(
                            color: kGrayBy6,
                            fontSize: kFontSize,
                          ),
                          textAlign: TextAlign.right,
                          textWidthBasis: TextWidthBasis.longestLine,
                        ),
                      ),
                      ListTile(
                        dense: true,
                        title: Text(
                          'Nguồn tiền:',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: kDarkTextColor,
                            fontSize: kFontSize,
                          ),
                        ),
                        trailing: Text(
                          "Ví đầu tư chung",
                          style: TextStyle(
                            color: kGrayBy6,
                            fontSize: kFontSize,
                          ),
                        ),
                      ),
                      ListTile(
                        dense: true,
                        title: Text(
                          'Phí giao dịch:',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: kDarkTextColor,
                            fontSize: kFontSize,
                          ),
                        ),
                        trailing: Text(
                          "0 %",
                          style: TextStyle(
                            color: kGrayBy6,
                            fontSize: kFontSize,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Hệ thống đang có sự cố vui lòng liên hệ Krowd để được hỗ trợ chi tiết.",
                    style: TextStyle(
                      fontSize: kFontSize,
                      color: bRed,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Container(
                    child: PrimaryButton(
                      title: "Quay lại dự án",
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
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
        child: InvestmentStatusContent(),
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
}
