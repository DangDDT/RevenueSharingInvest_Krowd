import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/ui/_common/loading/circular_loading.dart';
import 'package:rsi/ui/_common/pull_refresh.dart';
import 'widgets/invest_screen_navbar.dart';
import 'widgets/project_list_view.dart';
import 'widgets/scroll_bar.dart';
import 'widgets/total_asset_card.dart';

class InvestScreen extends StatefulWidget {
  @override
  _InvestScreenState createState() => _InvestScreenState();
}

class _InvestScreenState extends State<InvestScreen> {
  final _scrollController = ScrollController();

  void setupScrollController(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0) {
          final selectedFieldId =
              context.read<FieldCubit>().state.selectedField.id;
          context
              .read<FetchInvestProjectCubit>()
              .loadProjects(true, selectedFieldId);
        }
      }
    });
  }

  Future _loadData() async {
    context.read<FieldCubit>()..fetchFields();
    context.read<FetchInvestProjectCubit>()
      ..init()
      ..loadProjects(false, "0000");
    context.read<UserCubit>().loadUserProfile();
    context.read<WalletCubit>().loadWallets();
    context.read<NotificationCubit>()..fetchNotifications(false);
  }

  @override
  void initState() {
    _loadData();
    setupScrollController(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PullRefresh(
        action: () => _loadData(),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: <Widget>[
              Container(
                color: kPrimaryColor,
                child: InvestScreenNavBar(),
              ),
              TotalAssetCard(),
              BlocBuilder<FieldCubit, FieldState>(
                builder: (context, state) {
                  return ScrollBar(listItem: state.fields);
                },
              ),
              BlocBuilder<FieldCubit, FieldState>(
                builder: (context, state) {
                  if (state.status == FieldStatus.success)
                    return ProjectListView(scroll: _scrollController);
                  else
                    return CircularLoading();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
