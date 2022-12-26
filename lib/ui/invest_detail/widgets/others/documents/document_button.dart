import 'package:flutter/material.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/router/router_constants.dart';

class DocumentButton extends StatelessWidget {
  const DocumentButton({
    Key? key,
    required this.title,
    required this.url,
  }) : super(key: key);

  final String title;
  final String url;
  @override
  Widget build(BuildContext context) {
    void _readDocument() => Navigator.pushNamed(context, documentReaderRoute,
        arguments: [title, url]);
    return Container(
      decoration: BoxDecoration(
        color: nWhite,
        borderRadius: BorderRadius.circular(kBorder),
        boxShadow: kBoxShadow,
      ),
      margin: EdgeInsets.only(top: 10),
      child: ListTile(
          onTap: _readDocument,
          minLeadingWidth: 0,
          leading:
              Image.asset("assets/images/document.png", height: 24, width: 24),
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
    );
  }
}
