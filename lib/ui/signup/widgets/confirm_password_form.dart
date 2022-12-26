import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/l10n/support_locale.dart';
import 'package:rsi/ui/_common/buttons/primary_button.dart';
import 'package:rsi/ui/_common/textfields/required_textfield.dart';

class ConfirmPasswordForm extends StatelessWidget {
  final VoidCallback onConfirm;
  const ConfirmPasswordForm({
    Key? key,
    required this.size,
    required this.onConfirm,
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
            height: size.height * .1,
            child: Column(
              children: [
                Container(
                  height: size.height * .05,
                  child: Text(l10n.enterSecurityPassword,
                      style: TextStyle(
                          fontSize: kFontSize, fontWeight: FontWeight.bold)),
                ),
                Container(
                    height: size.height * .05,
                    child: Text(l10n.attentionAndRemember,
                        style: TextStyle(
                            fontSize: kFontSize - 2,
                            color: kDarkTextColor.withOpacity(.4))))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.0025),
            height: size.height * .3,
            child: Column(
              children: <Widget>[
                passwordField(l10n.password),
                confirmPasswordField(l10n.confirmPassword),
                SizedBox(height: 10),
                conditionText1("* ${l10n.moreThanEightCharacters}"),
                conditionText2({
                  "passwordStrength": "* ${l10n.passwordStrength}",
                  "high": " ${l10n.high}"
                })
              ],
            ),
          ),
          submitButton(l10n.done)
        ],
      ),
    );
  }

  Widget passwordField(String title) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return RequiredTextField(
          title: title,
          obscureText: true,
          onChangedString: context.read<SignUpCubit>().onPasswordChanged,
          errorText: state.status == SignUpStatus.invalid
              ? state.passwordInvalidMessage
              : null,
        );
      },
    );
  }

  Widget confirmPasswordField(String title) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return RequiredTextField(
          title: title,
          obscureText: true,
          onChangedString: context.read<SignUpCubit>().onPasswordConfirmChanged,
          errorText: state.status == SignUpStatus.invalid
              ? state.confirmPasswordInvalidMessage
              : null,
        );
      },
    );
  }

  Widget submitButton(String title) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return PrimaryButton(
          title: title,
          onPressed: () async =>
              await context.read<SignUpCubit>().onSubmitRegisterForm()
                  ? onConfirm()
                  : null,
        );
      },
    );
  }

  Widget conditionText1(String content) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return Container(
          height: size.height * .03,
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding - 10),
          child: Align(
            alignment: Alignment.topLeft,
            child: RichText(
              text: new TextSpan(
                style: new TextStyle(
                  fontSize: kFontSize - 2,
                  color: kDarkTextColor.withOpacity(.4),
                ),
                children: <TextSpan>[
                  new TextSpan(text: content),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget conditionText2(Map<String, String> content) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return Container(
          height: size.height * .03,
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding - 10),
          child: Align(
            alignment: Alignment.topLeft,
            child: RichText(
              text: new TextSpan(
                style: new TextStyle(
                  fontSize: kFontSize - 2,
                  color: kDarkTextColor.withOpacity(.4),
                ),
                children: <TextSpan>[
                  new TextSpan(text: content["passwordStrength"]),
                  new TextSpan(
                      text: content["high"],
                      style: new TextStyle(color: kPrimaryColor)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
