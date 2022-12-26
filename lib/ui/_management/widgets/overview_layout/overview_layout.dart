import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/models/models.dart';
import 'package:rsi/ui/_common/pull_refresh.dart';
import 'widgets/invested_projects.dart';
import 'widgets/total_asset.dart';

class OverViewLayout extends StatefulWidget {
  const OverViewLayout({
    Key? key,
  }) : super(key: key);

  @override
  State<OverViewLayout> createState() => _OverViewLayoutState();
}

class _OverViewLayoutState extends State<OverViewLayout> {
  Future<void> _loadData() async {
    context.read<FetchInvestedProjectCubit>().loadInvestedProjects();
    context.read<WalletCubit>().loadWallets();
    context.read<InvestorOverviewCubit>().fetchOverview();
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PullRefresh(
      action: () => _loadData(),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: TotalAsset(),
            ),
            Container(
              child: InvestedProjectLayout(),
            ),
          ],
        ),
      ),
    );
  }
}
