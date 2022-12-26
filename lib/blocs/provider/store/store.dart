import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/resources/global.dart';
import 'package:rsi/router/router_constants.dart';

class Store {
  NavigatorState? get _navigator => Global.useCurrentState();

  List<SingleChildWidget> getProviders() => [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.status == AuthStatus.authenticated) {
              _navigator!.pushNamedAndRemoveUntil(clientRoute, (_) => false);
            } else {
              _navigator!.pushNamedAndRemoveUntil(welcomeRoute, (_) => false);
            }
          },
        ),
        BlocProvider(create: (_) => UserCubit()),
        BlocProvider(create: (_) => FetchProjectDetailCubit()),
        BlocProvider(create: (_) => FetchInvestProjectCubit()),
        BlocProvider(create: (_) => WalletTransactionOverviewCubit()),
        BlocProvider(create: (_) => WalletTransactionResearchCubit()),
        BlocProvider(create: (_) => WalletCubit()),
        BlocProvider(create: (_) => TopupCubit()),
        BlocProvider(create: (_) => WithdrawCubit()),
        BlocProvider(create: (_) => WithdrawRequestCubit()),
        BlocProvider(create: (_) => PackageCubit()),
        BlocProvider(create: (_) => StageCubit()),
        BlocProvider(create: (_) => StageReturnCubit()),
        BlocProvider(create: (_) => InvestmentCubit()),
        BlocProvider(create: (_) => AccountTransactionCubit()),
        BlocProvider(create: (_) => FetchInvestedProjectCubit()),
        BlocProvider(create: (_) => CartCubit()),
        BlocProvider(create: (_) => ReportRevenueCubit()),
        BlocProvider(create: (_) => BillCubit()),
        BlocProvider(create: (_) => FieldCubit()),
        BlocProvider(create: (_) => InvestedProjectDetailCubit()),
        BlocProvider(create: (_) => InvestorOverviewCubit()),
        BlocProvider(create: (_) => ProjectUpdateCubit()),
        BlocProvider(create: (_) => TransferCubit()),
      ];
}
