import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rsi/blocs/validators.dart';
import 'package:rsi/resources/remote/auth/index.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthService _authService;
  late final Validators _validators;
  LoginCubit(
    this._authService,
  )   : this._validators = new Validators(),
        super(const LoginState());

  void onEmailChanged(String email) {
    emit(state.copyWith(status: LoginStatus.inputing, email: email));
  }

  void onPasswordChanged(String password) {
    emit(state.copyWith(status: LoginStatus.inputing, password: password));
  }

  void onLoginWithEmailAndPasswordPressed() async {
    if (state.status == LoginStatus.failure) {
      return;
    }
    emit(state.copyWith(status: LoginStatus.loading));
    String? emailInvalidMessage = _validators.emailValid(state.email);
    String? passwordInvalidMessage = _validators.passwordValid(state.password);
    bool isValid =
        emailInvalidMessage == null && passwordInvalidMessage == null;
    if (!isValid) {
      emit(
        state.copyWith(
          status: LoginStatus.invalid,
          emailInvalidMessage: emailInvalidMessage,
          passwordInvalidMessage: passwordInvalidMessage,
        ),
      );
    } else {
      try {
        await _authService.logInWithEmailAndPassword(
          email: state.email,
          password: state.password,
        );
      } on LogInWithEmailAndPasswordFailure catch (e) {
        emit(state.copyWith(
          status: LoginStatus.failure,
          errorMessage: e.message,
        ));
      }
    }
  }

  void onLoginWithGooglePressed() async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      await _authService
          .logInWithGoogle()
          .onError<LogInWithGoogleFailure>((error, stackTrace) {
        emit(
          state.copyWith(
            status: LoginStatus.failure,
            errorMessage: error.message,
          ),
        );
      });
    } on LogInWithGoogleFailure catch (e) {
      emit(state.copyWith(
        status: LoginStatus.failure,
        errorMessage: e.message,
      ));
    }
  }

  void onLoginWithFacebookPressed() async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      await _authService.logInWithFacebook();
    } on LogInWithFacebookFailure catch (e) {
      emit(state.copyWith(
        status: LoginStatus.failure,
        errorMessage: e.message,
      ));
    }
  }
}
