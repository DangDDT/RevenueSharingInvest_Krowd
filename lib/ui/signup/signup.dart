import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/blocs_export.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/resources/remote/auth/index.dart';
import 'package:rsi/router/router_constants.dart';
import 'package:rsi/ui/_common/step_progress_bar.dart';

import 'widgets/confirm_password_form.dart';
import 'widgets/email_and_otp_form.dart';
import 'widgets/full_name_form.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(context.read<AuthService>()),
      child: SignUpView(),
    );
  }
}

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  int _currentStep = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onConfirmOTP() => {_nextStep(), Navigator.pop(context)};

  void _nextStep() => {setState(() => _currentStep++)};

  void _previousStep() => {
        if (_currentStep > 0)
          setState(() => _currentStep--)
        else
          {
            Navigator.pop(context),
          }
      };
  void _onSubmitRegisterForm() => {
        Navigator.pushReplacementNamed(
          context,
          signUpSuccessRoute,
        )
      };
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<Widget> listWidget = [
      FullNameForm(onNext: _nextStep),
      EmailAndOTPForm(size: size, onConfirmOTP: _onConfirmOTP),
      ConfirmPasswordForm(size: size, onConfirm: _onSubmitRegisterForm),
    ];

    var bodySignUpPage =
        Container(width: size.width, child: listWidget.elementAt(_currentStep));

    var appBar = AppBar(
      backgroundColor: kBackgroundColor,
      leading: IconButton(
        icon: Icon(BACKWARD_ICON, color: kDarkTextColor),
        onPressed: _previousStep,
      ),
      title: StepProgressBar(
          currentStep: _currentStep, totalSteps: listWidget.length),
      elevation: 0,
    );

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                  left: kDefaultPadding, right: kDefaultPadding),
              child: Column(
                children: <Widget>[
                  bodySignUpPage,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
