import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:sizer/sizer.dart';
import 'dart:math' as math;

const ITEM_LIMIT_SIZE = 7;

class Collapse extends StatefulWidget {
  const Collapse({Key? key, required this.title, required this.panel})
      : super(key: key);
  final String title;
  final Widget panel;
  @override
  State<Collapse> createState() => _CollapseState();
}

class _CollapseState extends State<Collapse> {
  bool isShow = true;
  @override
  Widget build(BuildContext context) {
    final _title = widget.title;
    final _panel = widget.panel;
    return Container(
      child: Column(
        children: [
          Container(
            width: 100.w,
            constraints: BoxConstraints(minHeight: 5.h, maxHeight: 6.h),
            margin: EdgeInsets.symmetric(vertical: 10),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: nWhite,
              borderRadius: BorderRadius.circular(kBorder),
              boxShadow: kBoxShadow,
            ),
            child: ListTile(
              onTap: () => setState(() {
                isShow = !isShow;
              }),
              leading: Text(
                _title,
                style: TextStyle(
                  fontSize: FontSize.large.size,
                  fontWeight: FontWeight.bold,
                  color: kDarkTextColor.withOpacity(.9),
                ),
              ),
              trailing: Transform.rotate(
                angle: isShow ? 90 * math.pi / 180 : 0,
                child: Icon(
                  Icons.chevron_right,
                  color: kGrayBy6,
                ),
              ),
            ),
          ),
          Visibility(
              visible: isShow,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: isShow ? 1 : 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: nWhite,
                    borderRadius: BorderRadius.circular(kBorder),
                    boxShadow: kBoxShadow,
                  ),
                  child: _panel,
                ),
              ))
        ],
      ),
    );
  }
}
