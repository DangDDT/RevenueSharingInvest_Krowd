import 'package:flutter/material.dart';
import 'package:rsi/foundation/constants.dart';

class CircularLoading extends StatelessWidget {
  Widget build(BuildContext context) => Container(
        height: 100,
        padding: EdgeInsets.all(8),
        child: Center(
          child: CircularProgressIndicator(
            color: kPrimaryColor,
          ),
        ),
      );
}
