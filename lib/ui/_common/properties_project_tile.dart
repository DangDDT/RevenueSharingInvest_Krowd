import 'package:flutter/material.dart';
import 'package:rsi/foundation/constants.dart';

class PropertiesProjectTile extends StatelessWidget {
  const PropertiesProjectTile({
    Key? key,
    required this.leading,
    required this.trailing,
  }) : super(key: key);
  final String leading;
  final String trailing;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding - 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            leading,
            style: TextStyle(fontSize: kFontSize),
          ),
          Text(
            trailing,
            style: TextStyle(fontSize: kFontSize, color: kGrayBy6),
          )
        ],
      ),
    );
  }
}
