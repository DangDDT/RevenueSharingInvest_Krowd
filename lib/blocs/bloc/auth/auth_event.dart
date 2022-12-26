part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthUserChanged extends AuthEvent {
  final AuthUser user;

  AuthUserChanged(this.user);
}

class LogOutRequested extends AuthEvent {}
