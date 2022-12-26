import 'package:flutter/material.dart';

class IconSticker extends StatelessWidget {
  const IconSticker({
    Key? key,
    this.imageLink,
    required this.color,
    required this.backgroundColor,
    this.shapeSize = 45,
    this.icon,
    this.iconSize = 45,
  }) : super(key: key);
  final String? imageLink;
  final IconData? icon;
  final Color color;
  final Color backgroundColor;
  final double? shapeSize;
  final double? iconSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: shapeSize,
      height: shapeSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
      ),
      child: getElement(),
    );
  }

  Widget getElement() {
    if (imageLink != null) {
      return Image.asset(
        imageLink.toString(),
        color: color,
      );
    } else {
      return Icon(
        icon,
        color: color,
        size: iconSize,
      );
    }
  }
}
