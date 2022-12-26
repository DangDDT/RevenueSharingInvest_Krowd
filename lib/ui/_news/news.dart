import 'package:flutter/material.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/ui/_news/widgets/listViewNews.dart';
import 'package:rsi/ui/_news/widgets/newsCarouselSlider.dart';

import '../../foundation/ui_config.dart' as ui_config;

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  var _listNews = ui_config.LIST_NEWS;
  void _onPressedSliderItem(value) => debugPrint(value);
  void _onPressedListNewsItem(value) => debugPrint(value);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  top: kDefaultPadding,
                  left: kDefaultPadding,
                  right: kDefaultPadding,
                ),
                child: NewsCarouselSlider(
                  listNews: _listNews,
                  onPressed: _onPressedSliderItem,
                ),
              ),
              ListViewNews(
                listNews: _listNews,
                onPressed: _onPressedListNewsItem,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
