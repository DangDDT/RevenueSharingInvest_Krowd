import 'package:flutter/material.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/l10n/support_locale.dart';

import '../../_common/textfields/required_textfield.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.useL10n();
    return Container(
      child: Column(
        children: [
          Container(
              height: size.height * 0.2,
              child: Image.asset(
                "assets/images/confirm_password.png",
              )),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.0025),
            child: Column(
              children: <Widget>[
                RequiredTextField(
                  title: l10n.email,
                  obscureText: false,
                  onChangedString: (text) {},
                ),
                RequiredTextField(
                  title: l10n.password,
                  obscureText: true,
                  onChangedString: (text) {},
                ),
                Container(
                  height: size.height * .03,
                  padding:
                      EdgeInsets.symmetric(horizontal: kDefaultPadding + 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: RichText(
                      text: new TextSpan(
                        style: new TextStyle(
                          fontSize: kFontSize - 2,
                          color: kDarkTextColor.withOpacity(.4),
                        ),
                        children: <TextSpan>[
                          new TextSpan(text: "${l10n.passwordStrength} "),
                          new TextSpan(
                              text: l10n.high,
                              style: new TextStyle(color: kPrimaryColor)),
                        ],
                      ),
                    ),
                  ),
                ),
                RequiredTextField(
                  title: l10n.confirmPassword,
                  obscureText: true,
                  onChangedString: (text) {},
                ),
                Container(
                  height: size.height * .03,
                  padding:
                      EdgeInsets.symmetric(horizontal: kDefaultPadding + 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: RichText(
                      text: new TextSpan(
                        style: new TextStyle(
                          fontSize: kFontSize - 2,
                          color: kDarkTextColor.withOpacity(.4),
                        ),
                        children: <TextSpan>[
                          new TextSpan(text: l10n.moreThanEightCharacters),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
