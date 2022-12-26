part of 'login_cubit.dart';

enum LoginStatus {
  initial,
  loading,
  success,
  failure,
  invalid,
  inputing,
}

class LoginState extends Equatable {
  final LoginStatus status;
  final String? errorMessage;
  final String email;
  final String password;
  final String? emailInvalidMessage;
  final String? passwordInvalidMessage;

  const LoginState({
    this.errorMessage,
    this.email = "",
    this.password = "",
    this.status = LoginStatus.initial,
    this.emailInvalidMessage,
    this.passwordInvalidMessage,
  });

  LoginState copyWith({
    String? errorMessage,
    String? email,
    String? password,
    LoginStatus? status,
    String? emailInvalidMessage,
    String? passwordInvalidMessage,
  }) {
    return LoginState(
      errorMessage: errorMessage ?? this.errorMessage,
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      emailInvalidMessage: emailInvalidMessage,
      passwordInvalidMessage: passwordInvalidMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        email,
        password,
        emailInvalidMessage,
        passwordInvalidMessage,
      ];
}
