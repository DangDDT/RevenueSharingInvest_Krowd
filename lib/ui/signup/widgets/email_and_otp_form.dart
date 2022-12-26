import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/cubit/signup/signup_cubit.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/l10n/support_locale.dart';
import 'package:rsi/ui/_common/buttons/primary_button.dart';
import 'package:rsi/ui/_common/textfields/required_textfield.dart';
import 'package:rsi/ui/signup/widgets/confirm_otp_register_modal.dart';

class EmailAndOTPForm extends StatelessWidget {
  const EmailAndOTPForm({
    Key? key,
    required this.size,
    required this.onConfirmOTP,
  }) : super(key: key);

  final Size size;
  final VoidCallback onConfirmOTP;
  @override
  Widget build(BuildContext context) {
    final l10n = L10n.useL10n();
    return Container(
      child: Column(
        children: <Widget>[
          Container(
              height: size.height * .2,
              child: Image.asset(
                "assets/images/say_hello.png",
              )),
          Container(
            height: size.height * .1,
            child: Column(
              children: [
                Container(
                  height: size.height * .05,
                  child: renderHelloText(l10n.hello),
                ),
                Container(
                  height: size.height * .05,
                  child: Text(
                    l10n.pleaseEnterYourPhoneNumber,
                    style: TextStyle(
                        fontSize: kFontSize - 2,
                        color: kDarkTextColor.withOpacity(.4)),
                  ),
                )
              ],
            ),
          ),
          emailField(l10n.email),
          Container(
            height: size.height * .2,
            child: Text(
              l10n.otpDescription,
              style: TextStyle(fontSize: kFontSize - 2),
            ),
          ),
          confirmModal(
            context,
            {
              "sendOTP": l10n.sendOTP,
              "accountVerification": l10n.accountVerification
            },
          )
        ],
      ),
    );
  }

  Widget renderHelloText(String helloText) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return Text(
          "$helloText, ${state.firstname} ${state.lastname}",
          style: TextStyle(fontSize: kFontSize, fontWeight: FontWeight.bold),
        );
      },
    );
  }

  Widget emailField(String title) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return RequiredTextField(
          title: title,
          obscureText: false,
          onChangedString: context.read<SignUpCubit>().onEmailChanged,
          errorText: state.status == SignUpStatus.invalid
              ? state.emailInvalidMessage
              : null,
          hintText: "investor@gmail.com",
        );
      },
    );
  }

  Widget confirmModal(context, Map<String, String> text) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return PrimaryButton(
          title: "${text["sendOTP"]}",
          onPressed: () async =>
              await context.read<SignUpCubit>().isValidEmailForm()
                  ? showOtpRegisterModal(context, size, onConfirmOTP,
                      "${text["accountVerification"]}", state.email)
                  : null,
        );
      },
    );
  }
}
