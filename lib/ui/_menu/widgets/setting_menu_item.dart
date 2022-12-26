import 'package:flutter/material.dart';
import 'package:rsi/foundation/constants.dart';

class SettingMenuItem extends StatelessWidget {
  const SettingMenuItem({
    Key? key,
    required this.size,
    required this.imageLink,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final Size size;
  final String imageLink;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: size.height * 0.05,
        child: ListTile(
            onTap: onPressed,
            leading: Image.asset(imageLink, height: 24, width: 24),
            title: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: kDarkTextColor,
                fontSize: kFontSize,
              ),
            ),
            trailing: Icon(
              Icons.chevron_right,
              color: kGrayBy6,
            )),
      ),
    );
  }
}
