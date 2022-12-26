import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl;
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/l10n/support_locale.dart';
import 'package:rsi/ui/_common/dashline_separator.dart';
import 'package:rsi/ui/_common/loading/circular_loading.dart';

class TotalAsset extends StatelessWidget {
  const TotalAsset({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletCubit, WalletState>(builder: (context, state) {
      if (state.status == WalletStatus.loading)
        return renderLoading();
      else if (state.status == WalletStatus.success) {
        return renderSuccess(context, state);
      } else {
        return CircularLoading();
      }
    });
  }

  Container renderSuccess(BuildContext context, WalletState state) {
    final totalAsset = state.totalAsset;
    final formatter = intl.NumberFormat.decimalPattern();
    final headingStyle = TextStyle(
        fontSize: kFontSize, color: kPrimaryColor, fontWeight: FontWeight.bold);
    final titleStyle = TextStyle(fontSize: kFontSize, color: nGray6);
    final subTitleStyle = TextStyle(
        fontSize: kFontSize - 2,
        color: kDarkTextColor,
        fontWeight: FontWeight.bold);
    final l10n = L10n.useL10n();
    return Container(
      child: Column(
        children: [
          BlocBuilder<InvestorOverviewCubit, InvestorOverviewState>(
            builder: (context, state) {
              final overview = state.overview;
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    decoration: BoxDecoration(
                      color: nWhite,
                      borderRadius: BorderRadius.circular(kBorder),
                      boxShadow: kBoxShadow,
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.all(0),
                          title: Text(
                            "${l10n.totalAsset}:",
                            style: TextStyle(
                                fontSize: kFontSize,
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor),
                          ),
                          trailing: Text(
                            "${formatter.format(totalAsset)} đ",
                            style: TextStyle(
                              fontSize: kFontSize + 2,
                              color: kSecondaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        DashLineSeparator(
                          color: nGray5,
                        ),
                        ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.all(0),
                          leading: Icon(Icons.add, size: 16, color: bGreen),
                          minLeadingWidth: 0,
                          title: Text("Tiền nạp vào:", style: titleStyle),
                          trailing: Text(
                              "${formatter.format(overview.totalDepositedAmount)} đ",
                              style: subTitleStyle),
                        ),
                        ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.all(0),
                          leading: Icon(Icons.offline_share,
                              size: 16, color: bOrange),
                          minLeadingWidth: 0,
                          title: Text("Đã đầu tư:", style: titleStyle),
                          trailing: Text(
                              "${formatter.format(overview.totalInvestedAmount)} đ",
                              style: subTitleStyle),
                        ),
                        ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.all(0),
                          leading:
                              Icon(Icons.receipt_long, size: 16, color: bBlue),
                          minLeadingWidth: 0,
                          title: Text("Đã nhận từ dự án:", style: titleStyle),
                          trailing: Text(
                              "${formatter.format(overview.totalReceivedAmount)} đ",
                              style: subTitleStyle),
                        ),
                        ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.all(0),
                          leading: Icon(Icons.card_membership,
                              size: 16, color: bIndigo),
                          minLeadingWidth: 0,
                          title: Text("Đã rút ra:", style: titleStyle),
                          trailing: Text(
                              "${formatter.format(overview.totalWithdrawedAmount)} đ",
                              style: subTitleStyle),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    decoration: BoxDecoration(
                      color: nWhite,
                      borderRadius: BorderRadius.circular(kBorder),
                      boxShadow: kBoxShadow,
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.all(0),
                          title:
                              Text("Số dự án đã đầu tư:", style: headingStyle),
                          trailing: Text(
                            "${overview.numOfInvestedProject} dự án",
                            style: TextStyle(
                              fontSize: kFontSize + 2,
                              color: kSecondaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        DashLineSeparator(
                          color: nGray5,
                        ),
                        ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.all(0),
                          leading:
                              Icon(Icons.timelapse, size: 16, color: bOrange),
                          minLeadingWidth: 0,
                          title: Text("Dự án đang đợi kêu gọi:",
                              style: titleStyle),
                          trailing: Text(
                              "${overview.numOfCallingForInvestmentInvestedProject} dự án",
                              style: subTitleStyle),
                        ),
                        ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.all(0),
                          leading:
                              Icon(Icons.run_circle, size: 16, color: bGreen),
                          minLeadingWidth: 0,
                          title:
                              Text("Dự án đang hoạt động:", style: titleStyle),
                          trailing: Text(
                              "${overview.numOfActiveInvestedProject} dự án",
                              style: subTitleStyle),
                        ),
                        ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.all(0),
                          leading: Icon(CupertinoIcons.return_icon,
                              size: 16, color: bRed),
                          minLeadingWidth: 0,
                          title: Text("Dự án kêu gọi thất bại:",
                              style: titleStyle),
                          trailing: Text(
                              "${overview.numOfCallingTimeIsOverInvestedProject} dự án",
                              style: subTitleStyle),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    decoration: BoxDecoration(
                      color: nWhite,
                      borderRadius: BorderRadius.circular(kBorder),
                      boxShadow: kBoxShadow,
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.all(0),
                          title: Text("Lượt đầu tư:", style: headingStyle),
                          trailing: Text(
                            "${overview.numOfInvestment} lần đầu tư",
                            style: TextStyle(
                              fontSize: kFontSize + 2,
                              color: kSecondaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        DashLineSeparator(
                          color: nGray5,
                        ),
                        ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.all(0),
                          leading: Icon(Icons.check, size: 16, color: bGreen),
                          minLeadingWidth: 0,
                          title: Text("Đầu tư thành công:", style: titleStyle),
                          trailing: Text(
                              "${overview.numOfSuccessInvestment} lần đầu tư",
                              style: subTitleStyle),
                        ),
                        ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.all(0),
                          leading: Icon(CupertinoIcons.multiply_circle,
                              size: 16, color: bRed),
                          minLeadingWidth: 0,
                          title: Text("Đầu tư thất bại:", style: titleStyle),
                          trailing: Text(
                              "${overview.numOfFailedInvestment} lần đầu tư",
                              style: subTitleStyle),
                        ),
                        ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.all(0),
                          leading: Icon(CupertinoIcons.return_icon,
                              size: 16, color: bYellow),
                          minLeadingWidth: 0,
                          title: Text("Huỷ đầu tư:", style: titleStyle),
                          trailing: Text(
                              "${overview.numOfCanceledInvestment} lần đầu tư",
                              style: subTitleStyle),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  CircularLoading renderLoading() => CircularLoading();
}
