import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:intl/intl.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/l10n/support_locale.dart';
import 'package:rsi/models/models.dart';
import 'package:intl/intl.dart' as intl;
import 'package:rsi/ui/_common/dashline_separator.dart';
import 'package:rsi/ui/_common/loading/circular_loading.dart';

class WalletTransactionScreen extends StatefulWidget {
  const WalletTransactionScreen({Key? key}) : super(key: key);

  @override
  State<WalletTransactionScreen> createState() =>
      _WalletTransactionScreenState();
}

class _WalletTransactionScreenState extends State<WalletTransactionScreen> {
  @override
  void initState() {
    final walletState = context.read<WalletCubit>().state;
    context.read<WalletTransactionResearchCubit>()
      ..init(walletState.walletList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tra cứu giao dịch ví",
          style: TextStyle(
            color: kLightTextColor,
            fontSize: kFontSize + 2,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              decoration: BoxDecoration(
                color: nWhite,
                borderRadius: BorderRadius.circular(kBorder),
                boxShadow: kBoxShadow,
              ),
              child: BlocBuilder<WalletTransactionResearchCubit,
                  WalletTransactionResearchState>(
                builder: (context, state) {
                  return Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      tilePadding: EdgeInsets.all(0),
                      title: ListTile(
                        leading: Text(
                          "${state.numOfWalletTransaction < 10 ? "0" : ""}${state.numOfWalletTransaction}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: kFontSize + 8,
                              color: kPrimaryColor),
                        ),
                        dense: true,
                        contentPadding: EdgeInsets.all(0),
                        minLeadingWidth: 0,
                        title: Text(
                          "Từ ${state.fromDateCondition ?? "<ngày>"} đến ${state.toDateCondition ?? "<ngày>"}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            state.walletCondition?.walletType?.name ?? "<Ví>"),
                      ),
                      trailing: Icon(Icons.filter_alt),
                      children: [
                        fromDateField(),
                        toDateField(),
                        walletDropdown(),
                        researchButton(state),
                      ],
                    ),
                  );
                },
              ),
            ),
            BlocBuilder<WalletTransactionResearchCubit,
                WalletTransactionResearchState>(builder: (context, state) {
              switch (state.status) {
                case WalletTransactionResearchStatus.loading:
                  return renderLoading();
                case WalletTransactionResearchStatus.success:
                  return renderSuccessContent(context);
                case WalletTransactionResearchStatus.failure:
                  return Container();
                default:
                  return Container();
              }
            }),
          ]),
        ),
      ),
    );
  }

  Builder researchButton(WalletTransactionResearchState state) {
    return Builder(builder: (context) {
      final isValid = state.fromDateCondition != null &&
          state.toDateCondition != null &&
          state.walletCondition != null;
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isValid == true ? kPrimaryColor : nGray6,
          borderRadius: BorderRadius.circular(kBorder),
          boxShadow: kBoxShadow,
        ),
        child: TextButton(
          onPressed: () => isValid
              ? context
                  .read<WalletTransactionResearchCubit>()
                  .fetchWalletTransaction()
              : null,
          child: Text(
            "Tra cứu",
            style: TextStyle(color: kLightTextColor),
          ),
        ),
      );
    });
  }

  Widget fromDateField() {
    return BlocBuilder<WalletTransactionResearchCubit,
        WalletTransactionResearchState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: nWhite,
            borderRadius: BorderRadius.circular(kBorder),
            border: Border.fromBorderSide(
              BorderSide(color: nGray4, width: 1.0),
            ),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 5),
            minLeadingWidth: 0,
            horizontalTitleGap: 0,
            onTap: () => showMaterialDatePicker(
              title: "Từ ngày",
              context: context,
              selectedDate: new DateFormat("dd/MM/yyyy")
                  .parse(state.fromDateCondition ?? "01/01/2022"),
              onChanged: context
                  .read<WalletTransactionResearchCubit>()
                  .onChangeFromDate,
              firstDate: DateFormat("dd/MM/yyyy").parse("01/01/2022"),
              lastDate: DateTime.now(),
            ),
            title: Text(
              "Từ ngày:",
              style: TextStyle(
                fontSize: kFontSize - 2,
                fontWeight: FontWeight.bold,
                color: nGray5,
              ),
            ),
            trailing: Text(
              state.fromDateCondition ?? "Chọn ngày",
              style: TextStyle(
                fontSize: kFontSize,
                color: kDarkTextColor,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget toDateField() {
    return BlocBuilder<WalletTransactionResearchCubit,
        WalletTransactionResearchState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: nWhite,
            borderRadius: BorderRadius.circular(kBorder),
            border: Border.fromBorderSide(
              BorderSide(color: nGray4, width: 1.0),
            ),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 5),
            minLeadingWidth: 0,
            horizontalTitleGap: 0,
            onTap: () => showMaterialDatePicker(
              title: "Đến ngày",
              context: context,
              selectedDate: new DateFormat("dd/MM/yyyy")
                  .parse(state.fromDateCondition ?? "01/01/2022"),
              onChanged:
                  context.read<WalletTransactionResearchCubit>().onChangeToDate,
              firstDate: DateFormat("dd/MM/yyyy").parse("01/01/2022"),
              lastDate: DateTime.now(),
            ),
            title: Text(
              "Đến ngày:",
              style: TextStyle(
                fontSize: kFontSize - 2,
                fontWeight: FontWeight.bold,
                color: nGray5,
              ),
            ),
            trailing: Text(
              state.toDateCondition ?? "Chọn ngày",
              style: TextStyle(
                fontSize: kFontSize,
                color: kDarkTextColor,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget walletDropdown() {
    return BlocBuilder<WalletTransactionResearchCubit,
        WalletTransactionResearchState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: nWhite,
            borderRadius: BorderRadius.circular(kBorder),
            border: Border.fromBorderSide(
              BorderSide(color: nGray4, width: 1.0),
            ),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 5),
            minLeadingWidth: 0,
            horizontalTitleGap: 0,
            onTap: () => showMaterialRadioPicker<Wallet>(
              title: "Chọn ví",
              context: context,
              items: state.wallets ?? [],
              onChanged: context
                  .read<WalletTransactionResearchCubit>()
                  .onChangeSelectedWallet,
              selectedItem: state.walletCondition,
              transformer: (item) => item.walletType!.name,
            ),
            title: Text(
              "Ví:",
              style: TextStyle(
                fontSize: kFontSize - 2,
                fontWeight: FontWeight.bold,
                color: nGray5,
              ),
            ),
            trailing: Text(
              state.walletCondition?.walletType?.name ?? "Chọn ví",
              style: TextStyle(
                fontSize: kFontSize,
                color: kDarkTextColor,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget renderLoading() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircularLoading(),
      );
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

  Widget renderSuccessContent(BuildContext context) {
    final formatter = intl.NumberFormat.decimalPattern();
    final transactions =
        context.read<WalletTransactionResearchCubit>().state.walletTransactions;
    final localeProvider = context.read<LocaleProvider>();
    final transactionDescriptions =
        L10n.getTransactionDescriptions(localeProvider);
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: nWhite,
            borderRadius: BorderRadius.circular(kBorder),
            boxShadow: kBoxShadow,
          ),
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
                itemCount: transactions.length,
              );
          }),
        )
      ],
    );
  }
}
