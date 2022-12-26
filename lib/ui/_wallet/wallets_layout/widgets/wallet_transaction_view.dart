import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/l10n/support_locale.dart';
import 'package:rsi/models/models.dart';
import 'package:rsi/router/router_constants.dart';
import 'package:rsi/ui/_common/dashline_separator.dart';
import 'package:rsi/ui/_common/loading/circular_loading.dart';
import 'package:intl/intl.dart' as intl;

class WalletTransactionView extends StatefulWidget {
  final Wallet currentWalletState;
  const WalletTransactionView({
    Key? key,
    required this.currentWalletState,
  }) : super(key: key);

  @override
  State<WalletTransactionView> createState() => _WalletTransactionViewState();
}

class _WalletTransactionViewState extends State<WalletTransactionView> {
  void _loadData() {
    final currentWalletState = widget.currentWalletState;
    context
        .read<WalletTransactionOverviewCubit>()
        .fetchRecentlyWalletTransaction(currentWalletState.id);
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: nWhite,
        borderRadius: BorderRadius.circular(kBorder),
        boxShadow: kBoxShadow,
      ),
      child: Column(
        children: [
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            leading: Icon(Icons.view_timeline, color: kPrimaryColor),
            minLeadingWidth: 0,
            title: Text(
              "Giao dịch ví gần đây",
              style: TextStyle(
                  fontSize: kFontSize,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor),
            ),
            trailing: InkWell(
              onTap: () => Navigator.pushNamed(context, walletTransactionRoute),
              child: Text(
                "Tra cứu thêm giao dịch >>",
                style: TextStyle(
                  fontSize: kFontSize - 2,
                  fontStyle: FontStyle.normal,
                  color: sBlue3,
                ),
              ),
            ),
          ),
          Divider(height: 0),
          Container(
            child: BlocBuilder<WalletTransactionOverviewCubit,
                WalletTransactionOverviewState>(builder: (context, state) {
              if (state.status == WalletTransactionOverviewStatus.loading)
                return renderLoading();
              else if (state.status == WalletTransactionOverviewStatus.failure)
                return renderFailure();
              else {
                return renderSuccessContent(context);
              }
            }),
          )
        ],
      ),
    );
  }

  Widget renderLoading() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircularLoading(),
      );

  Widget renderSuccessContent(BuildContext context) {
    final formatter = intl.NumberFormat.decimalPattern();
    final transactions = context
        .read<WalletTransactionOverviewCubit>()
        .state
        .recentlyWalletTransactions;
    final localeProvider = context.read<LocaleProvider>();
    final transactionDescriptions =
        L10n.getTransactionDescriptions(localeProvider);
    return Column(
      children: [
        Container(
          child: Builder(builder: (context) {
            if (transactions.length == 0)
              return renderEmpty();
            else
              return ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final transaction = transactions[index];
                  return ListTile(
                    title: Text(
                      transactionDescriptions[transaction.description]
                          .toString(),
                      style: TextStyle(
                        fontSize: kFontSize - 2,
                      ),
                    ),
                    subtitle: Text(
                      transaction.createDate.toString(),
                      style: TextStyle(
                        fontSize: kFontSize - 4,
                      ),
                    ),
                    trailing: Text(
                      "${(transaction.type == "CASH_IN" || transaction.type == "DEPOSIT") ? "+" : "-"} ${formatter.format(transaction.amount)} đ",
                      style: TextStyle(
                        fontSize: kFontSize,
                        color: (transaction.type == "CASH_IN" ||
                                transaction.type == "DEPOSIT")
                            ? bGreen
                            : kSecondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: DashLineSeparator(
                    color: nGray2,
                  ),
                ),
                itemCount: transactions.length <= 6 ? transactions.length : 6,
              );
          }),
        )
      ],
    );
  }

  Widget renderEmpty() {
    return Container(
      padding: EdgeInsets.only(bottom: kDefaultPadding),
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
              'Hiện chưa có giao dịch nào xảy ra',
              style: TextStyle(fontSize: kFontSize),
            ),
          ),
        ],
      ),
    );
  }

  Widget renderFailure() {
    return Container(
      padding: EdgeInsets.only(bottom: kDefaultPadding),
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
              'Lỗi bất ngờ vui lòng thử lại',
              style: TextStyle(fontSize: kFontSize),
            ),
          ),
        ],
      ),
    );
  }
}
