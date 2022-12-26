import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/cubit/investment/investment_cubit.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/ui/_common/buttons/primary_button.dart';
import 'package:rsi/ui/_common/dashline_separator.dart';
import 'package:rsi/ui/_common/icon_sticker.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart' as intl;

class InvestmentStatusContent extends StatelessWidget {
  const InvestmentStatusContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatter = intl.NumberFormat.decimalPattern();
    return BlocBuilder<InvestmentCubit, InvestmentState>(
      builder: (context, state) {
        final res = state.res!;
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: IconSticker(
                color: nWhite,
                icon: (res.status == "SUCCESS")
                    ? Icons.check
                    : CupertinoIcons.multiply,
                backgroundColor:
                    (res.status == "SUCCESS") ? kPrimaryColor : bRed,
                iconSize: 70,
                shapeSize: 80,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
              child: Text(
                (res.status == "SUCCESS")
                    ? "Giao dịch thành công"
                    : "Giao dịch thất bại",
                style: TextStyle(fontSize: kFontSize + 4),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                "Đầu tư ${(res.status == "SUCCESS") ? "thành công" : "thất bại"} gói ${res.investedQuantity} ${res.packageName.toString().toLowerCase()}",
                style: TextStyle(fontSize: kFontSize, color: nGray6),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "${formatter.format(res.amount)} đ",
                style: TextStyle(
                  fontSize: kFontSize + 18,
                  color: (res.status == "SUCCESS") ? kPrimaryColor : bRed,
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
                      res.projectName.toString(),
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
                      'Thời gian:',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: kDarkTextColor,
                        fontSize: kFontSize,
                      ),
                    ),
                    trailing: Text(
                      res.createDate.toString(),
                      style: TextStyle(
                        color: kGrayBy6,
                        fontSize: kFontSize,
                      ),
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
                      res.fromWalletName.toString(),
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
                      res.fee.toString(),
                      style: TextStyle(
                        color: kGrayBy6,
                        fontSize: kFontSize,
                      ),
                    ),
                  ),
                  ListTile(
                    dense: true,
                    horizontalTitleGap: 0,
                    title: Text(
                      'Mã GD:',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: kDarkTextColor,
                        fontSize: kFontSize,
                      ),
                    ),
                    trailing: Container(
                      width: 45.w + 10,
                      child: Text(
                        res.id.toString(),
                        style: TextStyle(
                          color: kGrayBy6,
                          fontSize: kFontSize,
                        ),
                        textAlign: TextAlign.right,
                        textWidthBasis: TextWidthBasis.longestLine,
                      ),
                    ),
                  ),
                ],
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
        );
      },
    );
  }
}
