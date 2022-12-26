import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/l10n/support_locale.dart';
import 'package:rsi/foundation/constants.dart';

import '../../_common/buttons/button_with_icon.dart';
import '../../_common/buttons/primary_button.dart';

class BottomLoginPage extends StatelessWidget {
  const BottomLoginPage({
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
          // submitButton(context, l10n.login),
          // Container(
          //   margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
          //   child: Text(
          //     l10n.or,
          //     style: TextStyle(fontSize: kFontSize, color: kDarkTextColor),
          //   ),
          // ),
          Container(
            height: size.height * .1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                googleSignInButton(context),
                // facebookSignInButton(context)
              ],
            ),
          )
        ],
      ),
    );
  }

  // Widget submitButton(BuildContext context, String title) {
  //   return PrimaryButton(
  //     title: title,
  //     onPressed: context.read<LoginCubit>().onLoginWithEmailAndPasswordPressed,
  //   );
  // }

  Widget googleSignInButton(BuildContext context) {
    return ButtonWithIcon(
      size: size,
      title: "Google",
      icon: Image.asset("assets/images/google.png"),
      color: nWhite,
      onPressed: context.read<LoginCubit>().onLoginWithGooglePressed,
    );
  }

  Widget facebookSignInButton(BuildContext context) {
    return ButtonWithIcon(
      size: size,
      title: "Facebook",
      icon: Image.asset("assets/images/facebook.png"),
      color: nWhite,
      onPressed: context.read<LoginCubit>().onLoginWithFacebookPressed,
    );
  }
}
