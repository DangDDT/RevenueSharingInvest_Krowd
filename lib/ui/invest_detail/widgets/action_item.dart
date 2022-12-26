import 'package:flutter/material.dart';
import 'package:rsi/foundation/constants.dart';

class ActionItem extends StatelessWidget {
  const ActionItem({
    Key? key,
    required this.title,
    required this.iconLink,
    required this.onPressed,
    required this.trailingNumber,
  }) : super(key: key);
  final String title;
  final String iconLink;
  final int trailingNumber;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      horizontalTitleGap: 0,
      contentPadding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      leading: Image.asset(iconLink, height: 24, width: 24),
      title: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.normal,
            color: kDarkTextColor,
            fontSize: kFontSize),
      ),
      trailing: Text("$trailingNumber", style: TextStyle(color: nGray6)),
    );
  }
}
