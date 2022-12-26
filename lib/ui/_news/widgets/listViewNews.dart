import 'package:flutter/material.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:sizer/sizer.dart';

class ListViewNews extends StatelessWidget {
  const ListViewNews(
      {Key? key, required this.listNews, required this.onPressed})
      : super(key: key);
  final List listNews;
  final Function(String) onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: listNews
            .map((news) => InkWell(
                  onTap: () => onPressed(news["id"]),
                  child: Container(
                    height: 12.h,
                    width: 90.w,
                    margin:
                        EdgeInsets.symmetric(vertical: kDefaultPadding - 10),
                    decoration: BoxDecoration(
                      color: nWhite,
                      borderRadius: BorderRadius.circular(kBorder),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 25.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(kBorder),
                                bottomLeft: Radius.circular(kBorder)),
                            image: DecorationImage(
                                alignment: Alignment(-.2, 0),
                                image: AssetImage(listNews.first["image"]!),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: kDefaultPadding - 5),
                          margin: EdgeInsets.only(left: kDefaultPadding - 10),
                          width: 50.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  news["title"]!,
                                  style: TextStyle(
                                    fontSize: kFontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                margin: EdgeInsets.only(
                                    bottom: kDefaultPadding - 15),
                              ),
                              Container(
                                  child: Text(
                                news["createAt"]!,
                                style: TextStyle(
                                  fontSize: kFontSize - 4,
                                  fontWeight: FontWeight.normal,
                                  color: nGray6,
                                ),
                              ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
