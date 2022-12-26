import 'package:flutter/material.dart';
import 'package:rsi/l10n/support_locale.dart';
import 'package:rsi/router/router_constants.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/ui/_common/buttons/primary_button.dart';

class SignUpSuccessScreen extends StatelessWidget {
  const SignUpSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final l10n = L10n.useL10n();

    void _onPushToWelcomeScreen() => Navigator.pushNamedAndRemoveUntil(
        context, welcomeRoute, (route) => false);

    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        child: Column(
          children: [
            Container(
              height: size.height * .85,
              child: Stack(
                children: [
                  Positioned(
                    top: -150,
                    left: -100,
                    child: Transform.scale(
                      scale: 1.3,
                      child: Container(
                        child: Image.asset(
                          "assets/images/firework_background.png",
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: size.height * .4,
                          child: Image.asset(
                            "assets/images/firework_element.png",
                            height: 160,
                            width: 160,
                          ),
                        ),
                        Container(
                          height: size.height * .1 - 20,
                          child: Text(
                            "${l10n.awesome} !",
                            style: TextStyle(
                                color: kDarkTextColor,
                                fontSize: kFontSize + 8,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          child: Text(
                            l10n.signUpSuccessfully,
                            style: TextStyle(
                              color: kDarkTextColor,
                              fontSize: kFontSize,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: size.height * .1,
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: PrimaryButton(
                title: l10n.exploreNow,
                onPressed: _onPushToWelcomeScreen,
              ),
            )
          ],
        ),
      ),
    );
  }
}
