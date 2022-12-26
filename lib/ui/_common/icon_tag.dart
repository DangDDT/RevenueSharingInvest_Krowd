import 'package:flutter/material.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:sizer/sizer.dart';

class IconTag extends StatelessWidget {
  const IconTag({
    Key? key,
    required this.imageLink,
    required this.colorIcon,
    required this.title,
  }) : super(key: key);

  final String imageLink;
  final Color colorIcon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      decoration: BoxDecoration(
        color: kBackgroundColor.withOpacity(.4),
        borderRadius: BorderRadius.circular(kBorder),
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ImageIcon(
            AssetImage(imageLink),
            size: 18,
            color: colorIcon,
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 45.w),
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: kFontSize - 4, color: nGray8),
            ),
          )
        ],
      ),
    );
  }
}
