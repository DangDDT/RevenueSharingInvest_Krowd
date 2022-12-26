import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_formatter/numeric_formatter.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:intl/intl.dart' as intl;
import 'package:rsi/models/models.dart';
import 'package:rsi/ui/_common/textfields/topup_textfield.dart';
import 'package:rsi/ui/_common/unordered_list.dart';
import 'package:sizer/sizer.dart';

class TransferScreen extends StatefulWidget {
  @override
  _TransferScreenState createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    context.read<TransferCubit>().init();
    super.initState();
  }

  void _onPop() => Navigator.pop(context);
  final formatter = intl.NumberFormat.decimalPattern();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        toolbarHeight: size.height * 0.07,
        backgroundColor: kPrimaryColor,
        leading: InkWell(
          onTap: _onPop,
          child: Icon(
            Icons.chevron_left,
            color: nWhite,
          ),
        ),
        title: Text(
          "Chuyển tiền",
          style: TextStyle(
            fontSize: kFontSize + 2,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            color: kLightTextColor,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(kDefaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: nWhite,
                borderRadius: BorderRadius.circular(kBorder),
                boxShadow: kBoxShadow,
              ),
              margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
              padding: EdgeInsets.all(kDefaultPadding),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: nGray1,
                      borderRadius: BorderRadius.circular(kBorder),
                    ),
                    child: ListTile(
                      horizontalTitleGap: 0,
                      leading: Image.asset(
                        "assets/images/logo.png",
                        width: 30,
                        height: 30,
                      ),
                      title: BlocBuilder<WalletCubit, WalletState>(
                        builder: (context, state) {
                          return Text(
                            "Số dư ví:",
                            style: TextStyle(fontSize: kFontSize),
                          );
                        },
                      ),
                      trailing: BlocBuilder<WalletCubit, WalletState>(
                        builder: (context, state) {
                          final balanceWallet = state.currentWallet!.balance;
                          return Text(
                            "${formatter.format(balanceWallet)} đ",
                            style: TextStyle(
                              fontSize: kFontSize,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    child: transferField(context, "Số tiền cần chuyển"),
                  ),
                  UnorderedList([
                    "Số tiền tối thiểu bạn có thể chuyển là 100,000 đ",
                    "Số tiền tối đa bạn có thể chuyển trong 1 lần là 500,000,000 đ",
                  ])
                ],
              ),
            ),
            BlocBuilder<WalletCubit, WalletState>(
              builder: (context, state) {
                return Container(
                    decoration: BoxDecoration(
                      color: nWhite,
                      borderRadius: BorderRadius.circular(kBorder),
                      boxShadow: kBoxShadow,
                    ),
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              dense: true,
                              leading: Icon(Icons.send_sharp,
                                  size: 15, color: kPrimaryColor),
                              minLeadingWidth: 0,
                              title: Text("Chuyển từ ví",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: kFontSize - 2)),
                              subtitle: Text(
                                "${state.currentWallet?.walletType?.name}",
                                style: TextStyle(fontSize: kFontSize - 4),
                              ),
                            ),
                          ),
                          VerticalDivider(),
                          Expanded(
                            child: Builder(builder: (context) {
                              Wallet toWallet;
                              if (state.currentWallet!.walletType!.name ==
                                  "Ví thu tiền") {
                                toWallet = state.walletList[1];
                              } else {
                                toWallet = state.walletList[4];
                              }
                              return ListTile(
                                dense: true,
                                leading: Icon(Icons.archive,
                                    size: 15, color: kSecondaryColor),
                                minLeadingWidth: 0,
                                title: Text("Chuyển đến ví",
                                    style: TextStyle(
                                        color: kSecondaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: kFontSize - 2)),
                                subtitle: Text(
                                  "${toWallet.walletType?.name}",
                                  style: TextStyle(fontSize: kFontSize - 4),
                                ),
                              );
                            }),
                          )
                        ],
                      ),
                    ));
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: bottomBarWidget(),
    );
  }

  Widget bottomBarWidget() {
    return Container(
      height: 10.h,
      color: nWhite,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: BlocBuilder<TransferCubit, TransferState>(
          builder: (context, state) {
            final isLoading = state.status == TopupStatus.loading;
            return Container(
              padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
              child: ElevatedButton.icon(
                icon: isLoading
                    ? const CircularProgressIndicator()
                    : const Icon(Icons.add),
                label: Text(
                  isLoading ? 'Đang xử lý' : 'Chuyển tiền',
                  style: const TextStyle(fontSize: kFontSize + 2),
                ),
                onPressed: isLoading
                    ? null
                    : () => context
                        .read<TransferCubit>()
                        .onTransferWallet(state.transferValueInt!)
                        .whenComplete(() => Navigator.pop(context)),
                style:
                    ElevatedButton.styleFrom(backgroundColor: kSecondaryColor),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget transferField(BuildContext context, String title) {
    return BlocBuilder<TransferCubit, TransferState>(builder: (context, state) {
      return TopupTextField(
        onChangedString: (value) =>
            context.read<TransferCubit>().onTransferValueChange(value),
        keyboardType: TextInputType.number,
        title: title,
        inputFormatters: [ThousandsFormatter()],
        currentText: state.transferValueString,
        endIcon: Container(
          child: Text(
            "đ",
            style: TextStyle(
              fontSize: kFontSize,
              fontWeight: FontWeight.bold,
              color: nGray5,
            ),
          ),
        ),
      );
    });
  }
}
