import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/ui/_common/icon_tag.dart';
import 'package:rsi/ui/_common/loading/shimmer_loading.dart';
import 'package:sizer/sizer.dart';

const ENTITY_TYPE = "ALBUM";

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final project =
        context.read<FetchProjectDetailCubit>().state.projectDetailById!;
    final projectEntity = project.projectEntity!;
    final projectAlbum = projectEntity
        .firstWhere((value) => value.type == ENTITY_TYPE)
        .typeItemList!
        .map((e) => e.link as String);
    final projectImage = project.image as String;
    final slideItems = [projectImage, ...projectAlbum];

    return Column(
      children: <Widget>[
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    width: 80.w,
                    child: Text(
                      project.name.toString(),
                      style: TextStyle(
                        color: kDarkTextColor,
                        fontSize: kFontSize + 2,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  project.description.toString(),
                  style: TextStyle(
                    color: kGrayBy6,
                    fontSize: kFontSize - 2,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconTag(
                      colorIcon: kPrimaryColor,
                      imageLink: "assets/icons/tag-solid.png",
                      title: project.field!.name.toString(),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    IconTag(
                      colorIcon: bPink,
                      imageLink: "assets/icons/location-solid.png",
                      title: project.address.toString(),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: CarouselSlider(
                    items: slideItems.map((value) {
                      return ClipRRect(
                        borderRadius:
                            BorderRadius.all(Radius.circular(kBorder)),
                        child: Image.network(
                          value,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const ShimmerWidget.rectangular();
                          },
                          errorBuilder: (context, exception, stackTrace) =>
                              const Text('😢'),
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 250,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayAnimationDuration: Duration(milliseconds: 2000),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
