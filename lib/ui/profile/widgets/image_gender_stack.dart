import 'package:flutter/material.dart';
import 'package:rsi/foundation/constants.dart';

class ImageGenderStack extends StatelessWidget {
  const ImageGenderStack({
    Key? key,
    required this.avatarLink,
    required this.genderLink,
    required this.isShowGender,
  }) : super(key: key);

  final String avatarLink;
  final String genderLink;
  final bool isShowGender;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                avatarLink,
                height: 120,
                width: 120,
              ),
            ),
          ),
          isShowGender
              ? Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: nWhite,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: kBoxShadow,
                    ),
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset(
                      genderLink,
                      height: 25,
                      width: 25,
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
