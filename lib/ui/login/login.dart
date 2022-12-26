import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rsi/blocs/cubit/login/login_cubit.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/l10n/support_locale.dart';
import 'package:rsi/resources/remote/auth/auth_services.dart';
import 'widgets/bottom_login_page.dart';
import 'widgets/forgot_password_form.dart';
import 'widgets/login_form.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(context.read<AuthService>()),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.status == LoginStatus.failure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(
                    state.errorMessage!,
                    style: TextStyle(color: kErrorColor),
                  ),
                  backgroundColor: kBackgroundColor,
                ),
              );
          }
        },
        child: LoginView(),
      ),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _isLoginForm = true;
  @override
  void initState() {
    super.initState();
  }

  void _changeBody() {
    setState(() => {
          _isLoginForm = false,
        });
    Navigator.pop(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final l10n = L10n.useL10n();
    var bodyLoginPage = _isLoginForm
        ? LoginForm(
            size: size,
            onConfirmForgotPassword: _changeBody,
          )
        : ForgotPasswordForm(size: size);

    var appBar = AppBar(
      leading: IconButton(
        icon: Icon(BACKWARD_ICON, color: kLightTextColor),
        onPressed: () => {
          Navigator.pop(context),
        },
      ),
      title: Text(
        l10n.login,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: kLightTextColor,
          fontSize: kFontSize,
        ),
      ),
      centerTitle: true,
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
                  top: size.height * 0.05 - 30,
                  left: kDefaultPadding,
                  right: kDefaultPadding),
              child: Form(
                child: Column(
                  children: <Widget>[
                    bodyLoginPage,
                    BottomLoginPage(
                      size: size,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
