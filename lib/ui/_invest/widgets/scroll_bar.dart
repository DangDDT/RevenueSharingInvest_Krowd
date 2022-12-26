import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';

import '../../../models/field/field.dart';

class ScrollBar extends StatefulWidget {
  const ScrollBar({
    Key? key,
    required this.listItem,
  }) : super(key: key);

  final List<Field> listItem;

  @override
  State<ScrollBar> createState() => _ScrollBarState();
}

class _ScrollBarState extends State<ScrollBar> {
  Future _loadData(int index) async {
    context.read<FieldCubit>()
      ..onChangeSelectedFields(widget.listItem.elementAt(index)).whenComplete(
          () => context.read<FetchInvestProjectCubit>()
            ..init()
            ..loadProjects(
                false, context.read<FieldCubit>().state.selectedField.id));
  }

  num getNumOfProject() =>
      context.watch<FetchInvestProjectCubit>().state.numOfProject ?? 0;
  String getSelectedFieldId() =>
      context.watch<FieldCubit>().state.selectedField.id;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        boxShadow: kBoxShadow,
        color: nWhite,
      ),
      child: BlocBuilder<FieldCubit, FieldState>(
        builder: (context, state) {
          return DefaultTabController(
            length: widget.listItem.length,
            child: TabBar(
              onTap: _loadData,
              unselectedLabelColor: nGray6,
              labelColor: kSecondaryColor,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: nGray1,
              ),
              isScrollable: true,
              labelStyle:
                  TextStyle(fontSize: kFontSize, fontWeight: FontWeight.bold),
              tabs: widget.listItem
                  .map(
                    (item) => Builder(builder: (context) {
                      final isSelected = getSelectedFieldId() == item.id;
                      return Tab(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "${item.name} ${isSelected ? "(${getNumOfProject()})" : ""}",
                              style: TextStyle(
                                fontSize: kFontSize,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  )
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}
