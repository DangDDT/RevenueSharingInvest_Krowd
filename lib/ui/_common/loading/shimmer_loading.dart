import 'package:flutter/material.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final bool? hasMargin;
  final ShapeBorder? shapeBorder;
  const ShimmerWidget.rectangular({
    this.width = double.infinity,
    this.height = 300,
    this.shapeBorder = const RoundedRectangleBorder(),
    this.hasMargin = true,
  });

  const ShimmerWidget.circular(
      {required this.width,
      required this.height,
      this.shapeBorder = const CircleBorder(),
      this.hasMargin = true});

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        child: Container(
          width: width,
          height: height,
          decoration: ShapeDecoration(
            color: nGray3,
            shape: shapeBorder!,
          ),
          margin: hasMargin == true ? EdgeInsets.symmetric(vertical: 30) : null,
        ),
        baseColor: nGray3,
        highlightColor: nGray1,
      );
}
