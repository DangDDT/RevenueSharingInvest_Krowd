import 'package:flutter/material.dart';
import 'package:rsi/foundation/constants.dart';

class PullRefresh extends StatelessWidget {
  const PullRefresh({Key? key, required this.action, required this.child})
      : super(key: key);
  final Future<void> Function() action;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: kPrimaryColor,
      displacement: 10,
      edgeOffset: 0,
      onRefresh: action,
      child: child,
    );
  }
}
