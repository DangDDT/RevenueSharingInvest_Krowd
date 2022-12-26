part of 'auth_bloc.dart';

enum AuthStatus {
  authenticated,
  unauthenticated,
}

class AuthState extends Equatable {
  final AuthStatus status;
  final AuthUser user;
  const AuthState._({
    required this.status,
    this.user = const AuthUser(id: '', investorId: '', token: ''),
  });

  const AuthState.unauthenticated()
      : this._(status: AuthStatus.unauthenticated);

  const AuthState.authenticated({required AuthUser user})
      : this._(status: AuthStatus.authenticated, user: user);
  @override
  List<Object?> get props => [status, user];
}
