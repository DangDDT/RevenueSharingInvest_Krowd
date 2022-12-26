import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/ui/_client/client_screen.dart';
import 'package:rsi/ui/bills/bills.dart';
import 'package:rsi/ui/cart/cart.dart';
import 'package:rsi/ui/document_reader/document_reader.dart';
import 'package:rsi/ui/invest_detail/invest_detail.dart';
import 'package:rsi/ui/invested_detail/invested_active_detail.dart';
import 'package:rsi/ui/invested_detail/invested_investing_detail.dart';
import 'package:rsi/ui/invested_detail/invested_overtime_detail.dart';
import 'package:rsi/ui/invested_project/invested_project.dart';
import 'package:rsi/ui/login/login.dart';
import 'package:rsi/ui/_wallet/wallets_layout/widgets/wallet_card.dart';
import 'package:rsi/ui/notification/notification.dart';
import 'package:rsi/ui/profile/profile.dart';
import 'package:rsi/ui/signup/signup.dart';
import 'package:rsi/ui/signup/widgets/success_screen.dart';
import 'package:rsi/ui/status/cancel_investment/cancel_investment_status.dart';
import 'package:rsi/ui/status/investment/investment_status.dart';
import 'package:rsi/ui/status/withdraw/withdraw_status.dart';
import 'package:rsi/ui/topup/topup.dart';
import 'package:rsi/ui/transfer/transfer.dart';
import 'package:rsi/ui/wallet_transaction/wallet_transaction.dart';
import 'package:rsi/ui/welcome/welcome.dart';
import 'package:rsi/ui/withdraw/withdraw.dart';

import 'router_constants.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcomeRoute:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => Login());
      case signUpRoute:
        return MaterialPageRoute(builder: (_) => SignUp());
      case clientRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => NotificationCubit(),
            child: ClientScreen(),
          ),
        );
      case investDetailRoute:
        {
          final String projectId = settings.arguments as String;
          return MaterialPageRoute(
              builder: (_) => InvestDetailScreen(projectId: projectId));
        }
      case signUpSuccessRoute:
        return MaterialPageRoute(builder: (_) => SignUpSuccessScreen());
      case documentReaderRoute:
        {
          final List arguments = settings.arguments as List;
          final String documentName = arguments.elementAt(0);
          final String url = arguments.elementAt(1);
          return MaterialPageRoute(
              builder: (_) =>
                  DocumentReader(url: url, documentName: documentName));
        }
      case walletTransactionRoute:
        {
          return MaterialPageRoute(builder: (_) => WalletTransactionScreen());
        }
      case topupRoute:
        {
          return MaterialPageRoute(builder: (_) {
            return TopupScreen();
          });
        }
      case withdrawRoute:
        {
          final WALLET_TYPE withdrawFrom = settings.arguments as WALLET_TYPE;
          return MaterialPageRoute(
            builder: (_) {
              final balance = _
                  .read<WalletCubit>()
                  .state
                  .walletList[
                      withdrawFrom == WALLET_TYPE.I2_INVESTMENT_WALLET ? 1 : 4]
                  .balance!;
              final walletId = _
                  .read<WalletCubit>()
                  .state
                  .walletList[
                      withdrawFrom == WALLET_TYPE.I2_INVESTMENT_WALLET ? 1 : 4]
                  .id;
              _.read<WithdrawCubit>().init(walletId, balance);
              return WithdrawScreen();
            },
          );
        }
      case profileRoute:
        {
          return MaterialPageRoute(builder: (_) => ProfileScreen());
        }
      case cartRoute:
        {
          return MaterialPageRoute(builder: (_) => CartScreen());
        }
      case investedActiveDetailRoute:
        {
          final String projectId = settings.arguments as String;
          return MaterialPageRoute(
              builder: (_) => InvestedActiveDetailScreen(projectId: projectId));
        }
      case investedInvestingDetailRoute:
        {
          final String projectId = settings.arguments as String;
          return MaterialPageRoute(
              builder: (_) =>
                  InvestedInvestingDetailScreen(projectId: projectId));
        }
      case investedOvertimeDetailRoute:
        {
          final String projectId = settings.arguments as String;
          return MaterialPageRoute(
              builder: (_) =>
                  InvestedOvertimeDetailScreen(projectId: projectId));
        }
      case investedProjectRoute:
        {
          return MaterialPageRoute(builder: (_) => InvestedProjectScreen());
        }
      case billsRoute:
        {
          final String dailyReportId = settings.arguments as String;
          return MaterialPageRoute(
              builder: (_) => BillsScreen(dailyReportId: dailyReportId));
        }
      case transferRoute:
        return MaterialPageRoute(builder: (_) => TransferScreen());
      case investmentStatusRoute:
        return MaterialPageRoute(builder: (_) => InvestmentStatusScreen());
      case cancelInvestmentStatusRoute:
        return MaterialPageRoute(
            builder: (_) => CancelInvestmentStatusScreen());
      case withdrawStatusRoute:
        return MaterialPageRoute(builder: (_) => WithdrawStatusScreen());
      case notificationRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => NotificationCubit(),
            child: NotificationScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
