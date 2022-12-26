import 'package:flutter/material.dart';
import 'package:rsi/foundation/ui_config.dart';
import 'package:rsi/l10n/support_locale.dart';
import 'package:rsi/router/router_constants.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/ui/_common/buttons/primary_button.dart';
import 'package:rsi/ui/_common/buttons/secondary_button.dart';
import 'package:sizer/sizer.dart';
import 'widgets/change_language_tab_bar.dart';
import 'widgets/welcome_carousel_slider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final appVersion = APP_VERSION;
  _pushToSignUpScreen() => Navigator.pushNamed(context, signUpRoute);
  _pushToLoginScreen() => Navigator.pushNamed(context, loginRoute);

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.useL10n();
    var buttonContainer = Container(
      height: 20.h,
      child: Column(
        children: <Widget>[
          Container(
            height: 10.h,
            child: PrimaryButton(
              title: l10n.login,
              onPressed: _pushToLoginScreen,
            ),
          ),
          // Container(
          //   height: 10.h,
          //   child: SecondaryButton(
          //     title: l10n.signUp,
          //     onPress: _pushToSignUpScreen,
          //   ),
          // ),
        ],
      ),
    );

    // var versionAppString = Container(
    //     margin: EdgeInsets.only(left: 10),
    //     width: size.width * .4,
    //     child: Text(
    //       appVersion,
    //       style: TextStyle(fontSize: kFontSize - 4, color: nGray6),
    //     ));

    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          children: <Widget>[
            WelcomeCarouselSlider(),
            buttonContainer,
            // ChangeLanguageTabBar()
          ],
        ),
      ),
    );
  }
}
