import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/models/models.dart';
import 'package:rsi/ui/_common/loading/circular_loading.dart';

import 'package:sizer/sizer.dart';

import 'packages_card.dart';

Future<void> showPackageModal(
    BuildContext context, String title, ProjectDetail project) {
  return showModalBottomSheet<void>(
    isScrollControlled: true,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
    backgroundColor: Colors.white,
    context: context,
    builder: (context) {
      return PackageModal(title: title, project: project);
    },
  );
}

class PackageModal extends StatefulWidget {
  const PackageModal({
    Key? key,
    required this.title,
    required this.project,
  }) : super(key: key);
  final String title;
  final ProjectDetail project;

  @override
  State<PackageModal> createState() => _PackageModalState();
}

class _PackageModalState extends State<PackageModal> {
  @override
  void initState() {
    context.read<PackageCubit>()
      ..init(widget.project)
      ..fetchPackages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: GestureDetector(
        child: Container(
          height: 75.h,
          decoration: new BoxDecoration(
            color: kBackgroundColor,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(kBorder),
              topRight: const Radius.circular(kBorder),
            ),
          ),
          child: new LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 10.h,
                      child: Align(
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: kFontSize + 8,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: constraints.maxHeight * .85,
                      width: constraints.maxWidth * .75,
                      child: BlocBuilder<PackageCubit, PackageState>(
                        builder: (context, state) {
                          if (state.status == PackageStatus.loading) {
                            return CircularLoading();
                          } else if (state.status == PackageStatus.failure) {
                            return Container(
                              padding: EdgeInsets.only(bottom: kDefaultPadding),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    EMPTY_IMAGE,
                                    width: 300,
                                    height: 250,
                                  ),
                                  Center(
                                    child: Text(
                                      'Lỗi bất ngờ vui lòng thử lại !!!',
                                      style: TextStyle(fontSize: kFontSize),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else if (state.status == PackageStatus.success) {
                            final packages = state.packages!;
                            final colors = [
                              bIndigo,
                              bBlue,
                              bYellow,
                              bPink,
                              bTeal,
                              bPurple,
                              bOrange
                            ];
                            final _random = new Random();
                            return ListView(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              children: packages
                                  .map(
                                    (_package) => PackageCard(
                                      endows: _package.descriptionList,
                                      quantity: _package.quantity,
                                      remainingQuantity:
                                          _package.remainingQuantity,
                                      packageName: _package.name,
                                      packageValue: _package.price,
                                      darkColor: colors[
                                          _random.nextInt(colors.length)],
                                      lightColor: nGray1,
                                      id: _package.id,
                                    ),
                                  )
                                  .toList(),
                            );
                          } else {
                            return CircularLoading();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
