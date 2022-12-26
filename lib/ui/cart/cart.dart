import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pattern_formatter/numeric_formatter.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/ui/_common/loading/shimmer_loading.dart';
import 'package:rsi/ui/_common/textfields/topup_textfield.dart';
import 'package:rsi/ui/_common/unordered_list.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart' as intl;

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void _loadData() {
    final packageState = context.read<PackageCubit>().state;
    final projectToOrder = packageState.projectToOrder!;
    final packageToOrder = packageState.packageToOrder!;
    context.read<CartCubit>()
      ..init(packageToOrder, projectToOrder)
      ..fetchWalletBallance();
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thực hiện đầu tư"),
      ),
      body: BlocBuilder<CartCubit, CartState>(builder: (_, state) {
        final formatter = intl.NumberFormat.decimalPattern();
        final project = state.selectedProject!;
        final package = state.selectedPackage!;
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: kDefaultPadding),
            child: Column(
              children: [
                Container(
                  child: orderPackageField(context, "Nhập số gói bạn muốn mua"),
                ),
                Builder(builder: (context) {
                  if (state.walletBalance == null) {
                    return ShimmerWidget.rectangular(
                        height: 50, hasMargin: false);
                  } else {
                    final remainBalance =
                        state.walletBalance!.balance! - state.totalPrice;
                    return Column(
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
                            title: Text.rich(
                              TextSpan(
                                  text: "Số dư ví:",
                                  style: TextStyle(fontSize: kFontSize),
                                  children: [
                                    TextSpan(
                                      text:
                                          " ${formatter.format(state.walletBalance?.balance)} đ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: kFontSize - 2,
                                      ),
                                    )
                                  ]),
                            ),
                            trailing: ElevatedButton.icon(
                              icon: Icon(Icons.add),
                              label: Text(
                                "Nạp",
                                style: TextStyle(fontSize: kFontSize - 2),
                              ),
                              onPressed: () =>
                                  context.read<CartCubit>().onTopup(),
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(100, 20),
                                backgroundColor: kSecondaryColor,
                                padding: EdgeInsets.symmetric(horizontal: 0),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: nGray1,
                            borderRadius: BorderRadius.circular(kBorder),
                          ),
                          child: ListTile(
                            horizontalTitleGap: 0,
                            title: Text(
                              "Số dư sau giao dịch:",
                              style: TextStyle(fontSize: kFontSize - 2),
                            ),
                            trailing: Text(
                              "${formatter.format(remainBalance >= 0 ? remainBalance : 0)} đ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: kFontSize - 2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                }),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPadding, vertical: kDefaultPadding),
                  decoration: BoxDecoration(
                    color: nWhite,
                    borderRadius: BorderRadius.circular(kBorder),
                    boxShadow: kBoxShadow,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: kDefaultPadding),
                        child: Text(
                          "Thông tin gói đầu tư",
                          style: TextStyle(
                              fontSize: kFontSize, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: ListTile(
                          title: Text(
                            "Tên gói:",
                            style:
                                TextStyle(color: nGray6, fontSize: kFontSize),
                          ),
                          trailing: Text(
                            package.name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        child: ListTile(
                          title: Text(
                            "Số lượng gói:",
                            style:
                                TextStyle(color: nGray6, fontSize: kFontSize),
                          ),
                          trailing: Text(
                            "${package.remainingQuantity} / ${package.quantity} (gói)",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        child: ListTile(
                          title: Text(
                            "Giá trị gói đầu tư:",
                            style:
                                TextStyle(color: nGray6, fontSize: kFontSize),
                          ),
                          trailing: Text(
                            "${formatter.format(package.price)} đ / gói",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin:
                                EdgeInsets.symmetric(vertical: kDefaultPadding),
                            child: Text(
                              "Ưu đãi kèm theo trên mỗi gói đầu tư: ",
                              style: TextStyle(
                                  fontSize: kFontSize,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding),
                              child: UnorderedList(package.descriptionList)),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPadding, vertical: kDefaultPadding),
                  decoration: BoxDecoration(
                    color: nWhite,
                    borderRadius: BorderRadius.circular(kBorder),
                    boxShadow: kBoxShadow,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: kDefaultPadding),
                        child: Text(
                          "Thông tin dự án đầu tư",
                          style: TextStyle(
                              fontSize: kFontSize, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: ListTile(
                          title: Text(
                            "Tên dự án:",
                            style: TextStyle(
                                color: nGray6, fontSize: kFontSize - 2),
                          ),
                          subtitle: Text(
                            project.name.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: kDarkTextColor,
                                fontWeight: FontWeight.bold,
                                fontSize: kFontSize - 2),
                          ),
                        ),
                      ),
                      Container(
                        child: ListTile(
                          title: Text(
                            "Địa chỉ:",
                            style: TextStyle(
                                color: nGray6, fontSize: kFontSize - 2),
                          ),
                          subtitle: Text(
                            project.address.toString(),
                            style: TextStyle(
                                color: kDarkTextColor,
                                fontWeight: FontWeight.bold,
                                fontSize: kFontSize - 2),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
      bottomNavigationBar: bottomBarWidget(),
    );
  }

  Widget bottomBarWidget() {
    final formatter = intl.NumberFormat.decimalPattern();
    return Container(
      height: 25.h,
      decoration: BoxDecoration(
        color: nWhite,
        boxShadow: kBoxShadow,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: 5),
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  title: Text(
                    "Tổng tiền đầu tư:",
                    style: TextStyle(fontSize: kFontSize),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "${formatter.format(state.totalPrice)} đ",
                      style: TextStyle(
                        fontSize: kFontSize + 10,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                  trailing: Text(
                    "Phí: 0%",
                    style: TextStyle(fontSize: kFontSize, color: nGray5),
                  ),
                ),
                Container(
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.payment),
                    label: Text(
                      'Xác nhận',
                      style: const TextStyle(
                          fontSize: kFontSize, fontWeight: FontWeight.bold),
                    ),
                    onPressed: !state.isValid
                        ? null
                        : () => context.read<CartCubit>().onSubmit(
                            state.selectedProject!.id!,
                            state.selectedPackage!.id,
                            state.quantityPackageToOrderInt!),
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(420, 50),
                        backgroundColor: kSecondaryColor,
                        padding: EdgeInsets.all(0)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Text.rich(
                    TextSpan(
                      text:
                          'Nhấn xác nhận đồng nghĩa với việc bạn đồng ý với các ',
                      style: TextStyle(
                        fontSize: kFontSize,
                        color: nGray5,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'điều khoản sử dụng',
                          style: TextStyle(
                            fontSize: kFontSize,
                            color: kPrimaryColor,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () => {},
                        ),
                        TextSpan(
                          text: ' của Krowd',
                          style: TextStyle(fontSize: kFontSize, color: nGray5),
                        )
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget orderPackageField(BuildContext context, String title) {
    return BlocBuilder<CartCubit, CartState>(builder: (context, state) {
      return TopupTextField(
        onChangedString: (value) =>
            context.read<CartCubit>().onQuantityPackageChange(value),
        keyboardType: TextInputType.number,
        title: title,
        inputFormatters: [ThousandsFormatter()],
        currentText: state.quantityPackageToOrderString,
        errorText: state.errorString,
        endIcon: Container(
          child: Text(
            "gói",
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
