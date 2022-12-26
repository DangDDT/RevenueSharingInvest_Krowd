import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:rsi/resources/remote/auth/index.dart';
import 'package:sizer/sizer.dart';
import 'blocs/blocs_export.dart';
import 'foundation/constants.dart';
import 'resources/global.dart';
import 'router/router_constants.dart';
import 'router/router_generation.dart' as router;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.authService}) : super(key: key);
  final AuthService authService;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: ChangeNotifierProvider(
        create: (context) => LocaleProvider(),
        builder: (context, child) {
          return Consumer<LocaleProvider>(
            builder: (context, provider, child) {
              return Sizer(
                builder: (context, orientation, deviceType) {
                  return RepositoryProvider.value(
                    value: authService,
                    child: BlocProvider(
                      create: (context) => AuthBloc(
                        authSerivce: authService,
                      ),
                      child: AppView(
                        localeProvider: provider,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key, required this.localeProvider}) : super(key: key);
  final LocaleProvider localeProvider;

  @override
  Widget build(BuildContext context) {
    final _store = new Store();
    return MaterialApp(
        navigatorKey: Global.navigatorKey,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: router.Router.generateRoute,
        initialRoute: welcomeRoute,
        title: 'Revenue Sharing Invest',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        locale: localeProvider.locale,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: customThemeData(context),
        builder: (context, child) {
          return LoaderOverlay(
            useDefaultLoading: false,
            overlayWidget: Center(
              child: SpinKitCubeGrid(
                color: kPrimaryColor,
                size: 50.0,
              ),
            ),
            child: MultiProvider(
              providers: _store.getProviders(),
              child: child!,
            ),
          );
        });
  }
}

ThemeData customThemeData(context) => ThemeData(
      primaryColor: kLightTextColor,
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: kDarkTextColor,
            fontFamily: "Public Sans",
          ),
      appBarTheme: AppBarTheme(
        backgroundColor: kPrimaryColor,
      ),
    );
