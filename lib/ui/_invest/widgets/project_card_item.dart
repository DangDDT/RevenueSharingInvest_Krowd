import 'package:flutter/material.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:intl/intl.dart' as intl;
import 'package:rsi/l10n/support_locale.dart';
import 'package:rsi/models/models.dart';
import 'package:rsi/router/router_constants.dart';
import 'package:rsi/ui/_common/icon_tag.dart';
import 'package:rsi/ui/_common/loading/shimmer_loading.dart';
import 'package:rsi/ui/_common/progress_percent_bar.dart';
import 'package:sizer/sizer.dart';

class ProjectCardItem extends StatelessWidget {
  const ProjectCardItem({
    Key? key,
    required this.project,
  }) : super(key: key);

  final BasicProject project;
  @override
  Widget build(BuildContext context) {
    final formatter = intl.NumberFormat.decimalPattern();
    final l10n = L10n.useL10n();

    return InkWell(
      onTap: () => Navigator.pushNamed(context, investDetailRoute,
          arguments: project.id),
      child: Container(
          margin: EdgeInsets.symmetric(vertical: kDefaultPadding - 10),
          decoration: BoxDecoration(
            color: nWhite,
            borderRadius: BorderRadius.circular(kBorder),
            boxShadow: kBoxShadow,
          ),
          child: Column(
            children: <Widget>[
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(kBorder),
                            topRight: Radius.circular(kBorder)),
                        child: Image.network(
                          project.image.toString(),
                          width: 100.w,
                          height: 300,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress?.cumulativeBytesLoaded ==
                                loadingProgress?.expectedTotalBytes) {
                              return child;
                            }
                            return ShimmerWidget.rectangular(
                              width: 100.w,
                              height: 300,
                              hasMargin: false,
                            );
                          },
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          height: 30,
                          width: 50,
                          decoration: BoxDecoration(
                            color: kHotColor,
                            borderRadius: BorderRadius.circular(kBorder),
                          ),
                          alignment: Alignment.center,
                          child: Text("HOT",
                              style: TextStyle(
                                  color: kLightTextColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: kFontSize - 4)),
                        ),
                      ),
                    ]),
                    Container(
                      padding: EdgeInsets.only(
                        top: kDefaultPadding - 4,
                        bottom: kDefaultPadding - 4,
                        left: kDefaultPadding - 8,
                        right: kDefaultPadding - 8,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text(
                              project.name.toString(),
                              style: TextStyle(
                                  color: kDarkTextColor,
                                  fontSize: kFontSize + 2,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                IconTag(
                                  colorIcon: kPrimaryColor,
                                  imageLink: "assets/icons/tag-solid.png",
                                  title: project.fieldName.toString(),
                                ),
                                SizedBox(
                                  width: kDefaultPadding,
                                ),
                                IconTag(
                                  colorIcon: kHotColor,
                                  imageLink: "assets/icons/location-solid.png",
                                  title: project.address.toString(),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              project.description.toString(),
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: kGrayBy6,
                                  fontSize: kFontSize - 2,
                                  fontWeight: FontWeight.normal),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                l10n.invested,
                                style: TextStyle(fontSize: kFontSize),
                              ),
                              Text(
                                l10n.target,
                                style: TextStyle(fontSize: kFontSize),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            child: ProgressPercentBar(
                              currentPercent:
                                  ((project.investedCapital!.toInt() /
                                              project.investmentTargetCapital!
                                                  .toInt()) *
                                          100)
                                      .toInt(),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "${formatter.format(project.investedCapital)} đ",
                                  style: TextStyle(
                                      fontSize: kFontSize,
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "${formatter.format(project.investmentTargetCapital)} đ",
                                  style: TextStyle(
                                      fontSize: kFontSize,
                                      color: kSecondaryColor,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              child: Text(
                                'Nhấn để xem chi tiết >> ',
                                style: const TextStyle(
                                    fontSize: kFontSize - 2,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () => Navigator.pushNamed(
                                  context, investDetailRoute,
                                  arguments: project.id),
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(160, 20),
                                  backgroundColor: kSecondaryColor,
                                  padding: EdgeInsets.all(0)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
