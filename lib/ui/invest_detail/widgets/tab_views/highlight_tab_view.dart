import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'items/highlight_item_container.dart';

class HighlightTabView extends StatelessWidget {
  const HighlightTabView({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 50.h, minHeight: 30.h),
      child: ListView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        shrinkWrap: true,
        children: [HighlightListItem()],
      ),
    );
  }
}
