import 'package:flutter/material.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:sizer/sizer.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    Key? key,
    required this.title,
    required this.onPress,
    this.contentColor = kLightTextColor,
    this.backgroundColor = kSecondaryColor,
    this.enabled = true,
  }) : super(key: key);

  final String title;
  final VoidCallback onPress;
  final Color contentColor;
  final Color backgroundColor;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding - 10),
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      height: 54,
      width: 90.w,
      decoration: BoxDecoration(
        color: enabled ? backgroundColor : nGray4,
        borderRadius: BorderRadius.circular(kBorder),
        boxShadow: kBoxShadow,
      ),
      child: TextButton(
        onPressed: enabled ? onPress : () => {},
        child: Text(
          title,
          style: TextStyle(
            fontSize: kFontSize,
            fontWeight: FontWeight.bold,
            color: contentColor,
          ),
        ),
      ),
    );
  }
}
