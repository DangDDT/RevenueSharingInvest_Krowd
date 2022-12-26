import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/models/package/package.dart';
import 'package:rsi/ui/_common/buttons/secondary_button.dart';
import 'package:rsi/ui/_common/unordered_list.dart';
import 'package:intl/intl.dart' as intl;
import 'package:sizer/sizer.dart';

class PackageCard extends StatelessWidget {
  final String id;
  final String packageName;
  final num packageValue;
  final List<String> endows;
  final num remainingQuantity;
  final Color darkColor;
  final Color lightColor;
  final num quantity;
  const PackageCard({
    Key? key,
    required this.id,
    required this.packageName,
    required this.packageValue,
    required this.endows,
    this.darkColor = pGreen5,
    this.lightColor = pGreen1,
    required this.remainingQuantity,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatter = intl.NumberFormat.decimalPattern();
    final packageString = "${formatter.format(packageValue)} đ";
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: 65.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kBorder),
              color: darkColor,
              boxShadow: kBoxShadow,
            ),
            child: Container(
              height: 50,
              alignment: Alignment.center,
              child: Text(
                packageName.toUpperCase(),
                style: TextStyle(
                  fontSize: kFontSize,
                  fontWeight: FontWeight.w700,
                  color: kLightTextColor,
                ),
              ),
            ),
          ),
          Container(
            height: 50.h,
            width: 65.w,
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kBorder),
              color: nWhite,
              boxShadow: kBoxShadow,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: kDefaultPadding,
                  ),
                  child: Text(
                    packageString,
                    style: TextStyle(
                      fontSize: kFontSize + 2,
                      fontWeight: FontWeight.bold,
                      color: darkColor,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Đầu tư cho dự án $packageString',
                    style: TextStyle(
                      fontSize: kFontSize - 2,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kBorder),
                    color: lightColor,
                    boxShadow: kBoxShadow,
                  ),
                  child: Text(
                    'Số lượng gói: $remainingQuantity/$quantity',
                    style: TextStyle(
                      fontSize: kFontSize - 4,
                      color: darkColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Ưu đãi:',
                    style: TextStyle(
                      fontSize: kFontSize - 2,
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    child: Container(child: UnorderedList(endows)),
                  ),
                ),
                BlocBuilder<PackageCubit, PackageState>(
                  builder: (context, state) {
                    return Expanded(
                      child: Container(
                        alignment: FractionalOffset.bottomCenter,
                        child: SecondaryButton(
                          title: "Chọn",
                          onPress: () =>
                              context.read<PackageCubit>().chooseThePackage(
                                    context,
                                    new Package(
                                      id: id,
                                      descriptionList: endows,
                                      remainingQuantity: remainingQuantity,
                                      name: packageName,
                                      price: packageValue,
                                      quantity: quantity,
                                    ),
                                  ),
                          contentColor: kLightTextColor,
                          backgroundColor: kSecondaryColor,
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
