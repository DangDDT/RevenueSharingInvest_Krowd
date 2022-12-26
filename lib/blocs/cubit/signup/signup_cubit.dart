import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rsi/blocs/validators.dart';
import 'package:rsi/resources/remote/auth/index.dart';

part 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthService _authService;
  late final Validators _validators;
  SignUpCubit(this._authService)
      : this._validators = new Validators(),
        super(const SignUpState());

  void onFirstNameChanged(String firstname) {
    emit(state.copyWith(status: SignUpStatus.inputing, firstname: firstname));
  }

  void onLastNameChanged(String lastname) {
    emit(state.copyWith(status: SignUpStatus.inputing, lastname: lastname));
  }

  void onIsAgreeTermOfKrowdChanged(bool? isAgreeTermOfKrowd) {
    emit(state.copyWith(
        status: SignUpStatus.inputing, isAgreeTermOfKrowd: isAgreeTermOfKrowd));
  }

  void onEmailChanged(String email) {
    emit(state.copyWith(status: SignUpStatus.inputing, email: email));
  }

  void onPasswordChanged(String password) {
    emit(state.copyWith(
        status: SignUpStatus.inputing,
        password: password,
        confirmPassword: null));
  }

  void onPasswordConfirmChanged(String confirmPassword) {
    emit(state.copyWith(
        status: SignUpStatus.inputing, confirmPassword: confirmPassword));
  }

  bool isValidFullnameForm() {
    String? firstnameInvalidMessage =
        _validators.requiredValid(state.firstname);
    String? lastnameInvalidMessage = _validators.requiredValid(state.lastname);
    bool isValid = firstnameInvalidMessage == null &&
        lastnameInvalidMessage == null &&
        state.isAgreeTermOfKrowd == true;
    if (!isValid) {
      emit(
        state.copyWith(
          status: SignUpStatus.invalid,
          firstnameInvalidMessage: firstnameInvalidMessage,
          lastnameInvalidMessage: lastnameInvalidMessage,
        ),
      );
      return false;
    }
    return true;
  }

  Future<bool> isValidEmailForm() async {
    String? isExisted;
    String? emailInvalidMessage = _validators.emailValid(state.email);
    if (emailInvalidMessage == null) {
      isExisted = await _authService.isEmailExisted(email: state.email).then(
        (isExisted) {
          if (isExisted == true) return "This email is existed";
          return null;
        },
      );
    }
    bool isValid = emailInvalidMessage == null && isExisted == null;
    if (!isValid) {
      emit(
        state.copyWith(
          status: SignUpStatus.invalid,
          emailInvalidMessage: emailInvalidMessage ?? isExisted,
        ),
      );
      return false;
    }
    return true;
  }

  Future<bool> onSubmitRegisterForm() async {
    String? passwordInvalidMessage = _validators.passwordValid(state.password);
    String? passwordConfirmInvalidMessage = _validators.confirmPasswordValid(
      state.password,
      state.confirmPassword,
    );
    bool isValid =
        passwordInvalidMessage == null && passwordConfirmInvalidMessage == null;
    if (!isValid) {
      emit(
        state.copyWith(
          status: SignUpStatus.invalid,
          passwordInvalidMessage: passwordInvalidMessage,
          confirmPasswordInvalidMessage: passwordConfirmInvalidMessage,
        ),
      );
      return false;
    }
    try {
      await _authService.createUserWithEmailAndPassword(
        email: state.email,
        password: state.password,
        firstname: state.firstname,
        lastname: state.lastname,
      );
    } on SignUpWithEmailAndPasswordFailure catch (e) {
      emit(
        state.copyWith(
          status: SignUpStatus.failure,
          errorMessage: e.message,
        ),
      );
    }
    return true;
  }
}
