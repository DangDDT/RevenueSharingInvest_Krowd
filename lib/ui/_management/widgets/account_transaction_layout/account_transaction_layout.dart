import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/l10n/support_locale.dart';
import 'package:rsi/ui/_common/loading/circular_loading.dart';
import 'package:intl/intl.dart' as intl;
import 'package:rsi/ui/_common/pull_refresh.dart';
import 'package:sizer/sizer.dart';

class AccountTransactionLayout extends StatefulWidget {
  const AccountTransactionLayout({Key? key}) : super(key: key);

  @override
  State<AccountTransactionLayout> createState() =>
      _AccountTransactionLayoutState();
}

class _AccountTransactionLayoutState extends State<AccountTransactionLayout> {
  @override
  void initState() {
    context.read<AccountTransactionCubit>().fetchAccountTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PullRefresh(
      action: () =>
          context.read<AccountTransactionCubit>().fetchAccountTransactions(),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Container(
          decoration: BoxDecoration(
            color: nWhite,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(kBorder),
                topRight: Radius.circular(kBorder)),
          ),
          child: Column(
            children: [
              Container(
                child: BlocBuilder<AccountTransactionCubit,
                    AccountTransactionState>(builder: (context, state) {
                  if (state.status == AccountTransactionStatus.loading)
                    return renderLoading();
                  else if (state.status == AccountTransactionStatus.failure)
                    return renderFailure();
                  else {
                    return renderSuccessContent(context);
                  }
                }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget renderLoading() => CircularLoading();

  Widget renderSuccessContent(BuildContext context) {
    final formatter = intl.NumberFormat.decimalPattern();
    final transactions =
        context.read<AccountTransactionCubit>().state.filterAccountTransactions;
    final tabBarName =
        L10n.getListTabbarTransaction(context.read<LocaleProvider>());
    return Column(
      children: [
        Container(
          child: DefaultTabController(
            length: WalletTransactionFilter.values.length,
            child: TabBar(
              onTap: (value) => context
                  .read<AccountTransactionCubit>()
                  .onChangeFilterMode(value),
              labelStyle: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: kFontSize - 2),
              labelColor: kSecondaryColor,
              unselectedLabelColor: nGray5,
              unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.normal, fontSize: kFontSize - 4),
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: nWhite,
              ),
              tabs: WalletTransactionFilter.values
                  .map(
                    (e) => Tab(
                      text: tabBarName[e].toString(),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        Builder(builder: (context) {
          if (transactions.length == 0) return renderEmpty();
          return ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final transaction = transactions[index];
              return ListTile(
                minLeadingWidth: 0,
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(kBorder),
                      child: Image.asset(
                        orderType_image[transaction.orderType.toString()]
                            .toString(),
                        width: 30,
                        height: 30,
                      ),
                    ),
                    Expanded(
                      child: Builder(builder: (context) {
                        if (transaction.payType == "")
                          return SizedBox(height: 20);
                        else
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(kBorder),
                            child: Image.asset(
                              payType_image[transaction.payType].toString(),
                              width: 15,
                            ),
                          );
                      }),
                    ),
                  ],
                ),
                title: Text(
                  "${transaction.type == "TOP-UP" ? "Nạp tiền" : "Rút tiền"}: ${transaction.message.toString()}",
                  style: TextStyle(
                    fontSize: kFontSize - 2,
                    color: kDarkTextColor,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    transaction.createDate.toString(),
                    style: TextStyle(
                      fontSize: kFontSize - 4,
                    ),
                  ),
                ),
                trailing: Text(
                  "${transaction.type == "TOP-UP" ? "+" : "-"} ${formatter.format(int.parse(transaction.amount!))} đ",
                  style: TextStyle(
                    fontSize: kFontSize,
                    color: transaction.type == "TOP-UP" ? bGreen : bRed,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(
              height: 0,
            ),
            itemCount: transactions.length,
          );
        })
      ],
    );
  }

  Widget renderEmpty() {
    return Container(
      padding: EdgeInsets.only(bottom: 5.h),
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
              'Hiện chưa có giao dịch nào xảy ra trên ví này',
              style: TextStyle(fontSize: kFontSize),
            ),
          ),
        ],
      ),
    );
  }

  Widget renderFailure() {
    return Container();
  }
}
