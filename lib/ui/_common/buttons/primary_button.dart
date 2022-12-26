import 'package:flutter/material.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:sizer/sizer.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.title,
    this.onPressed,
    this.enable = true,
  }) : super(key: key);

  final String title;
  final VoidCallback? onPressed;
  final bool? enable;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding - 10),
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      height: 54,
      width: 90.w,
      decoration: BoxDecoration(
        color: this.enable == true ? kPrimaryColor : nGray6,
        borderRadius: BorderRadius.circular(kBorder),
        boxShadow: kBoxShadow,
      ),
      child: TextButton(
        onPressed: this.enable == true ? onPressed : null,
        child: Text(
          title,
          style: TextStyle(
            fontSize: kFontSize,
            fontWeight: FontWeight.bold,
            color: kLightTextColor,
          ),
        ),
      ),
    );
  }
}
