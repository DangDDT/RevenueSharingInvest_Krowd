import 'package:flutter/material.dart';
import 'package:rsi/foundation/constants.dart';

class StepProgressBar extends StatelessWidget {
  const StepProgressBar({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
  }) : super(key: key);

  final int currentStep;
  final int totalSteps;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // if you are wrapping this widget in some padding
    const leftPadding = kDefaultPadding;
    const rightPadding = kDefaultPadding;

    // width of the separete widget
    const separatedWidth = 2.0;

    return Row(
      children: [
        Container(
          width: screenWidth * 0.7,
          constraints: BoxConstraints(maxHeight: 8, maxWidth: screenWidth),
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: totalSteps,
            separatorBuilder: (context, index) => const SizedBox(
              width: separatedWidth,
            ),
            itemBuilder: (context, position) {
              return Container(
                width: (screenWidth * 0.75 -
                        ((totalSteps - 1) * separatedWidth) -
                        (leftPadding + rightPadding)) /
                    totalSteps,
                decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  height: 2,
                  decoration: BoxDecoration(
                      color: currentStep >= position
                          ? kPrimaryColor
                          : kLightPrimaryColor.withOpacity(.2),
                      borderRadius: BorderRadius.circular(20)),
                ),
              );
            },
          ),
        ),
        Container(
          width: screenWidth * .08,
          child: Text(
            "${currentStep + 1}/$totalSteps",
            style: TextStyle(
              color: kDarkTextColor,
              fontWeight: FontWeight.bold,
              fontSize: kFontSize - 1,
            ),
          ),
        )
      ],
    );
  }
}
