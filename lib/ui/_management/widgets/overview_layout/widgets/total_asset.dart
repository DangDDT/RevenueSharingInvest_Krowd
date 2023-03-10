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
                            "${formatter.format(totalAsset)} ??",
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
                          title: Text("Ti???n n???p v??o:", style: titleStyle),
                          trailing: Text(
                              "${formatter.format(overview.totalDepositedAmount)} ??",
                              style: subTitleStyle),
                        ),
                        ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.all(0),
                          leading: Icon(Icons.offline_share,
                              size: 16, color: bOrange),
                          minLeadingWidth: 0,
                          title: Text("???? ?????u t??:", style: titleStyle),
                          trailing: Text(
                              "${formatter.format(overview.totalInvestedAmount)} ??",
                              style: subTitleStyle),
                        ),
                        ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.all(0),
                          leading:
                              Icon(Icons.receipt_long, size: 16, color: bBlue),
                          minLeadingWidth: 0,
                          title: Text("???? nh???n t??? d??? ??n:", style: titleStyle),
                          trailing: Text(
                              "${formatter.format(overview.totalReceivedAmount)} ??",
                              style: subTitleStyle),
                        ),
                        ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.all(0),
                          leading: Icon(Icons.card_membership,
                              size: 16, color: bIndigo),
                          minLeadingWidth: 0,
                          title: Text("???? r??t ra:", style: titleStyle),
                          trailing: Text(
                              "${formatter.format(overview.totalWithdrawedAmount)} ??",
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
                              Text("S??? d??? ??n ???? ?????u t??:", style: headingStyle),
                          trailing: Text(
                            "${overview.numOfInvestedProject} d??? ??n",
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
                          title: Text("D??? ??n ??ang ?????i k??u g???i:",
                              style: titleStyle),
                          trailing: Text(
                              "${overview.numOfCallingForInvestmentInvestedProject} d??? ??n",
                              style: subTitleStyle),
                        ),
                        ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.all(0),
                          leading:
                              Icon(Icons.run_circle, size: 16, color: bGreen),
                          minLeadingWidth: 0,
                          title:
                              Text("D??? ??n ??ang ho???t ?????ng:", style: titleStyle),
                          trailing: Text(
                              "${overview.numOfActiveInvestedProject} d??? ??n",
                              style: subTitleStyle),
                        ),
                        ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.all(0),
                          leading: Icon(CupertinoIcons.return_icon,
                              size: 16, color: bRed),
                          minLeadingWidth: 0,
                          title: Text("D??? ??n k??u g???i th???t b???i:",
                              style: titleStyle),
                          trailing: Text(
                              "${overview.numOfCallingTimeIsOverInvestedProject} d??? ??n",
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
                          title: Text("L?????t ?????u t??:", style: headingStyle),
                          trailing: Text(
                            "${overview.numOfInvestment} l???n ?????u t??",
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
                          title: Text("?????u t?? th??nh c??ng:", style: titleStyle),
                          trailing: Text(
                              "${overview.numOfSuccessInvestment} l???n ?????u t??",
                              style: subTitleStyle),
                        ),
                        ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.all(0),
                          leading: Icon(CupertinoIcons.multiply_circle,
                              size: 16, color: bRed),
                          minLeadingWidth: 0,
                          title: Text("?????u t?? th???t b???i:", style: titleStyle),
                          trailing: Text(
                              "${overview.numOfFailedInvestment} l???n ?????u t??",
                              style: subTitleStyle),
                        ),
                        ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.all(0),
                          leading: Icon(CupertinoIcons.return_icon,
                              size: 16, color: bYellow),
                          minLeadingWidth: 0,
                          title: Text("Hu??? ?????u t??:", style: titleStyle),
                          trailing: Text(
                              "${overview.numOfCanceledInvestment} l???n ?????u t??",
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
