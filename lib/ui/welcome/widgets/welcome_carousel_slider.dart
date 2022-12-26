import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rsi/foundation/constants.dart';

import '../../../foundation/ui_config.dart' as ui_config;

class WelcomeCarouselSlider extends StatefulWidget {
  const WelcomeCarouselSlider({Key? key}) : super(key: key);
  @override
  _WelcomeCarouselSliderState createState() => _WelcomeCarouselSliderState();
}

class _WelcomeCarouselSliderState extends State<WelcomeCarouselSlider> {
  int _currentIndex = 0;
  var _listImage = ui_config.LIST_IMAGE_WELCOME_CAROUSEL;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          height: size.height * .6,
          child: CarouselSlider(
            items: _listImage
                .map(
                  (item) => Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(kBorder + 4),
                      child: Image.asset(
                        item,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
                .toList(),
            options: CarouselOptions(
              autoPlay: false,
              enlargeCenterPage: true,
              viewportFraction: 1,
              aspectRatio: 16 / 9,
              initialPage: 0,
              height: 460,
              onPageChanged: (index, reason) => {
                setState(() => {_currentIndex = index})
              },
              enableInfiniteScroll: false,
              pauseAutoPlayOnTouch: true,
            ),
          ),
        ),
        Container(
            height: size.height * .1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _listImage.map((item) {
                int index = _listImage.indexOf(item);
                var indicatorItem = _currentIndex == index
                    ? Container(
                        width: 16.0,
                        height: 6.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: new BorderRadius.all(
                                Radius.elliptical(100, 100))),
                      )
                    : Container(
                        width: 6.0,
                        height: 6.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: kDarkTextColor.withOpacity(.4),
                        ),
                      );
                return indicatorItem;
              }).toList(),
            ))
      ],
    );
  }
}
