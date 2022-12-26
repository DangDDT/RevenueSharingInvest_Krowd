part of 'signup_cubit.dart';

enum SignUpStatus {
  initial,
  loading,
  success,
  failure,
  invalid,
  inputing,
}

class SignUpState extends Equatable {
  final SignUpStatus status;
  final String firstname;
  final String lastname;
  final bool isAgreeTermOfKrowd;
  final String? errorMessage;
  final String email;
  final String password;
  final String confirmPassword;
  final String? confirmPasswordInvalidMessage;
  final bool isEmailVerified;
  final String? emailInvalidMessage;
  final String? passwordInvalidMessage;
  final String? firstnameInvalidMessage;
  final String? lastnameInvalidMessage;
  final String? otpInvalidMessage;

  const SignUpState({
    this.firstname = "",
    this.lastname = "",
    this.isAgreeTermOfKrowd = false,
    this.email = "",
    this.password = "",
    this.isEmailVerified = false,
    this.confirmPassword = "",
    this.status = SignUpStatus.initial,
    this.confirmPasswordInvalidMessage,
    this.emailInvalidMessage,
    this.passwordInvalidMessage,
    this.firstnameInvalidMessage,
    this.lastnameInvalidMessage,
    this.otpInvalidMessage,
    this.errorMessage,
  });

  SignUpState copyWith({
    SignUpStatus? status,
    String? firstname,
    String? lastname,
    bool? isAgreeTermOfKrowd,
    String? email,
    String? password,
    String? confirmPassword,
    bool? isEmailVerified,
    String? emailInvalidMessage,
    String? passwordInvalidMessage,
    String? confirmPasswordInvalidMessage,
    String? firstnameInvalidMessage,
    String? lastnameInvalidMessage,
    String? otpInvalidMessage,
    String? errorMessage,
  }) {
    return SignUpState(
      status: status ?? this.status,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      isAgreeTermOfKrowd: isAgreeTermOfKrowd ?? this.isAgreeTermOfKrowd,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      confirmPasswordInvalidMessage: confirmPasswordInvalidMessage,
      firstnameInvalidMessage: firstnameInvalidMessage,
      lastnameInvalidMessage: lastnameInvalidMessage,
      emailInvalidMessage: emailInvalidMessage,
      passwordInvalidMessage: passwordInvalidMessage,
      otpInvalidMessage: otpInvalidMessage,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        firstname,
        lastname,
        isAgreeTermOfKrowd,
        email,
        isEmailVerified,
        password,
        confirmPassword,
        confirmPasswordInvalidMessage,
        emailInvalidMessage,
        passwordInvalidMessage,
        firstnameInvalidMessage,
        lastnameInvalidMessage,
        errorMessage,
      ];
}
