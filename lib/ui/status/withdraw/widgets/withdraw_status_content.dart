import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/ui/_common/buttons/primary_button.dart';
import 'package:rsi/ui/_common/dashline_separator.dart';
import 'package:rsi/ui/_common/icon_sticker.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart' as intl;

class WithdrawStatusContent extends StatelessWidget {
  const WithdrawStatusContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatter = intl.NumberFormat.decimalPattern();
    return BlocBuilder<WithdrawRequestCubit, WithdrawRequestState>(
      builder: (context, state) {
        final res = state.res!;
        final isSuccess = res.status == "PENDING";
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: IconSticker(
                color: nWhite,
                icon: isSuccess ? Icons.check : CupertinoIcons.multiply,
                backgroundColor: isSuccess ? kPrimaryColor : bRed,
                iconSize: 70,
                shapeSize: 80,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
              child: Text(
                isSuccess
                    ? "Tạo lệnh rút tiền thành công"
                    : "Tạo lệnh rút tiền thất bại",
                style: TextStyle(fontSize: kFontSize + 4),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                "Tạo lệnh ${isSuccess ? "thành công" : "thất bại"}",
                style: TextStyle(fontSize: kFontSize, color: nGray6),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "${formatter.format(res.amount)} đ",
                style: TextStyle(
                  fontSize: kFontSize + 18,
                  color: isSuccess ? kPrimaryColor : bRed,
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
                    horizontalTitleGap: 10,
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
                      textAlign: TextAlign.right,
                      textWidthBasis: TextWidthBasis.longestLine,
                    ),
                  ),
                  ListTile(
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
                  title: "Quay lại",
                  onPressed: () {
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
