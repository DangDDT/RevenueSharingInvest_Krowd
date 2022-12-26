import 'package:flutter/material.dart';
import 'package:rsi/foundation/constants.dart';

class FAQ extends StatelessWidget {
  const FAQ({
    Key? key,
    required this.constraints,
    required this.question,
    required this.answer,
  }) : super(key: key);
  final BoxConstraints constraints;
  final String question;
  final String answer;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding - 10),
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
      ),
      decoration: new BoxDecoration(
        color: nWhite,
        borderRadius: BorderRadius.all(
          Radius.circular(kBorder + 4),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            question,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: kFontSize + 2,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            answer,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: kFontSize - 2,
              color: nGray6,
            ),
          )
        ],
      ),
    );
  }
}
