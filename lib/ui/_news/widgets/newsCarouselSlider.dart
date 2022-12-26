import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:sizer/sizer.dart';

class NewsCarouselSlider extends StatefulWidget {
  const NewsCarouselSlider(
      {Key? key, required this.listNews, required this.onPressed})
      : super(key: key);
  final List listNews;
  final Function(String) onPressed;
  @override
  _NewsCarouselSliderState createState() => _NewsCarouselSliderState();
}

class _NewsCarouselSliderState extends State<NewsCarouselSlider> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    var _listNew = this.widget.listNews;
    var onPressed = this.widget.onPressed;
    return Column(
      children: [
        CarouselSlider(
          items: _listNew
              .map(
                (item) => InkWell(
                  onTap: () => onPressed(item["id"]),
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kBorder),
                      color: nWhite,
                      boxShadow: kBoxShadow,
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 25.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(kBorder),
                                topRight: Radius.circular(kBorder)),
                            image: DecorationImage(
                              alignment: Alignment(-.2, 0),
                              image: AssetImage(
                                _listNew.first["image"]!,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: kDefaultPadding),
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(top: kDefaultPadding - 10),
                          child: Text(item["title"]!,
                              style: TextStyle(
                                  fontSize: kFontSize + 2,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: kDefaultPadding),
                          alignment: Alignment.topLeft,
                          child: Text(item["createAt"]!,
                              style: TextStyle(
                                  fontSize: kFontSize - 4, color: nGray6)),
                        )
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
            autoPlay: false,
            viewportFraction: 1,
            aspectRatio: 16 / 9,
            initialPage: 0,
            disableCenter: true,
            height: 40.h,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) => {
              setState(() => {_currentIndex = index})
            },
            enableInfiniteScroll: false,
            pauseAutoPlayOnTouch: true,
          ),
        ),
        Container(
            height: 2.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _listNew.map((item) {
                int index = _listNew.indexOf(item);
                var indicatorItem = Container(
                  width: 6.0,
                  height: 6.0,
                  margin: EdgeInsets.only(top: 10.0, left: 2.0, right: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex != index ? nGray6 : kSecondaryColor,
                  ),
                );
                return indicatorItem;
              }).toList(),
            ))
      ],
    );
  }
}
