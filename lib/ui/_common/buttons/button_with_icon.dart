import 'package:flutter/material.dart';
import 'package:rsi/foundation/constants.dart';

class ButtonWithIcon extends StatelessWidget {
  const ButtonWithIcon({
    Key? key,
    required this.size,
    required this.title,
    required this.icon,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  final Size size;
  final String title;
  final Widget icon;
  final Color color;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: size.width * .4,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(kBorder),
        boxShadow: kBoxShadow,
      ),
      child: TextButton.icon(
          icon: icon,
          onPressed: onPressed,
          label: Text(title,
              style: TextStyle(
                  fontSize: kFontSize,
                  fontWeight: FontWeight.bold,
                  color: kDarkTextColor))),
    );
  }
}
