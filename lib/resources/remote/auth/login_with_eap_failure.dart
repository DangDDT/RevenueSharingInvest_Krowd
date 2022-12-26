import 'package:rsi/l10n/support_locale.dart';

class LogInWithEmailAndPasswordFailure implements Exception {
  late final String? message;
  LogInWithEmailAndPasswordFailure([this.message]) {
    final l10n = L10n.useL10n();
    this.message ??= l10n.unknownExceptionOccurred;
  }

  factory LogInWithEmailAndPasswordFailure.fromCode(String code) {
    final l10n = L10n.useL10n();
    switch (code) {
      case 'invalid-email':
        return LogInWithEmailAndPasswordFailure(
          l10n.firebaseLoginEAPFailureInvalidEmail,
        );
      case 'user-disabled':
        return LogInWithEmailAndPasswordFailure(
          l10n.firebaseLoginEAPFailureUserDisabled,
        );
      case 'user-not-found':
        return LogInWithEmailAndPasswordFailure(
          l10n.firebaseLoginEAPFailureUserNotFound,
        );
      case 'wrong-password':
        return LogInWithEmailAndPasswordFailure(
          l10n.firebaseLoginEAPFailureWrongPassword,
        );
      default:
        return LogInWithEmailAndPasswordFailure();
    }
  }
}
