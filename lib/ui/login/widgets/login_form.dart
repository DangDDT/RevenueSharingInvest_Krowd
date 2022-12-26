import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/l10n/support_locale.dart';
import 'package:sizer/sizer.dart';
import '../../_common/textfields/required_textfield.dart';
import 'confirm_otp_forgot_password_modal.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required this.size,
    required this.onConfirmForgotPassword,
  }) : super(key: key);

  final Size size;
  final VoidCallback onConfirmForgotPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
            height: 20.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kBorder + 4),
              child: Image.asset(
                "assets/images/logo.png",
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: kDefaultPadding * 0.025),
            child: Column(
              children: <Widget>[
                // emailField(context, l10n.email),
                // passwordField(context, l10n.password),
              ],
            ),
          ),
          // Container(
          //   margin: EdgeInsets.only(bottom: size.height * 0.05),
          //   child: TextButton(
          //     onPressed: () {
          //       showOtpForgotPasswordModal(
          //           context,
          //           size,
          //           onConfirmForgotPassword,
          //           l10n.enterTheConfirmationCode,
          //           "chauhoang@gmail.com");
          //     },
          //     child: Text(
          //       l10n.forgotPassword,
          //       style: TextStyle(
          //         fontSize: kFontSize,
          //         color: nGray6,
          //         fontWeight: FontWeight.w400,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  // Widget emailField(BuildContext context, String title) {
  //   return BlocBuilder<LoginCubit, LoginState>(
  //     builder: (context, state) {
  //       return RequiredTextField(
  //         onChangedString: context.read<LoginCubit>().onEmailChanged,
  //         title: title,
  //         errorText: state.status == LoginStatus.invalid
  //             ? state.emailInvalidMessage
  //             : null,
  //         keyboardType: TextInputType.emailAddress,
  //       );
  //     },
  //   );
  // }

  // Widget passwordField(BuildContext context, String title) {
  //   return BlocBuilder<LoginCubit, LoginState>(
  //     builder: (context, state) {
  //       return RequiredTextField(
  //         onChangedString: context.read<LoginCubit>().onPasswordChanged,
  //         title: title,
  //         errorText: state.status == LoginStatus.invalid
  //             ? state.passwordInvalidMessage
  //             : null,
  //         obscureText: true,
  //       );
  //     },
  //   );
  // }

  // Widget phoneNumberField(AuthBloc bloc, title) {
  //   return StreamBuilder<String?>(
  //     stream: bloc.phoneNumber,
  //     builder: (context, snapshot) {
  //       return RequiredTextField(
  //         onChanged: bloc.onChangePhoneNumber,
  //         keyboardType: TextInputType.number,
  //         title: title,
  //         errorText: snapshot.hasError ? snapshot.error as String : null,
  //       );
  //     },
  //   );
  // }

  // Widget passwordField(AuthBloc bloc, title) {
  //   return StreamBuilder(
  //     stream: bloc.password,
  //     builder: (context, snapshot) {
  //       return RequiredTextField(
  //         onChanged: bloc.onChangePassword,
  //         obscureText: true,
  //         errorText: snapshot.hasError ? snapshot.error as String : null,
  //         title: title,
  //       );
  //     },
  //   );
  // }
}
