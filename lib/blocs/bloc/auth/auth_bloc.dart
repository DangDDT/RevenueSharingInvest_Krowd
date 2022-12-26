import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rsi/models/user.dart';
import 'package:rsi/resources/remote/auth/auth_services.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;

  late final StreamSubscription<AuthUser> _userSubscription;

  AuthBloc({required AuthService authSerivce})
      : _authService = authSerivce,
        super(
          authSerivce.currentUser.isNotEmpty
              ? AuthState.authenticated(user: authSerivce.currentUser)
              : const AuthState.unauthenticated(),
        ) {
    _userSubscription = _authService.user.listen(
      (user) {
        add(AuthUserChanged(user));
      },
    );
    on<AuthUserChanged>(_appUserChanged);
    on<LogOutRequested>(_logOutRequested);
  }

  // Xử lí event AppUserChanged
  FutureOr<void> _appUserChanged(
      AuthUserChanged event, Emitter<AuthState> emit) {
    emit(event.user.isEmpty
        ? const AuthState.unauthenticated()
        : AuthState.authenticated(user: event.user));
  }

  // Xử lí event LogOutRequested
  FutureOr<void> _logOutRequested(
      LogOutRequested event, Emitter<AuthState> emit) async {
    await _authService.signOut().then((_) => emit(AuthState.unauthenticated()));
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
