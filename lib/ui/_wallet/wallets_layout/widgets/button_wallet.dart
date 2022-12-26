import 'package:flutter/material.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:sizer/sizer.dart';

class ButtonWallet extends StatelessWidget {
  const ButtonWallet({
    Key? key,
    required this.label,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final String label;
  final String icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      constraints: BoxConstraints(minWidth: 35.w),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(kBorder + 15),
        border: Border.all(color: nWhite),
        boxShadow: kBoxShadow,
      ),
      child: TextButton.icon(
        label: Text(
          label,
          style: TextStyle(color: kLightTextColor, fontSize: kFontSize - 2),
        ),
        icon: Image.asset(
          icon,
          color: nWhite,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
