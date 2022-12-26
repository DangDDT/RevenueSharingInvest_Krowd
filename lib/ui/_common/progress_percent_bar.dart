import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:rsi/foundation/constants.dart';

class ProgressPercentBar extends StatelessWidget {
  const ProgressPercentBar({
    Key? key,
    required this.currentPercent,
  }) : super(key: key);
  final int currentPercent;
  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      //leaner progress bar
      animation: true,
      animationDuration: 1000,
      lineHeight: 10.0,
      percent: currentPercent / 100,
      barRadius: Radius.circular(50),
      progressColor: kLightPrimaryColor,
      backgroundColor: kDarkTextColor.withOpacity(.1),
    );
  }
}
