import 'package:rsi/l10n/support_locale.dart';

class LogInWithFacebookFailure implements Exception {
  late final String? message;
  LogInWithFacebookFailure([this.message]) {
    final l10n = L10n.useL10n();
    this.message ??= l10n.unknownExceptionOccurred;
  }

  factory LogInWithFacebookFailure.fromCode(String code) {
    final l10n = L10n.useL10n();
    switch (code) {
      case 'account-exists-with-different-credential':
        return LogInWithFacebookFailure(
          l10n.firebaseLoginFacebookFailureAccountExisted,
        );
      case 'invalid-credential':
        return LogInWithFacebookFailure(
          l10n.firebaseLoginFacebookFailureInvalidEmail,
        );
      case 'operation-not-allowed':
        return LogInWithFacebookFailure(
          l10n.firebaseLoginFacebookFailureOperationNotAllowed,
        );
      case 'user-disabled':
        return LogInWithFacebookFailure(
          l10n.firebaseLoginFacebookFailureUserDisabled,
        );
      case 'user-not-found':
        return LogInWithFacebookFailure(
          l10n.firebaseLoginFacebookFailureUserNotFound,
        );
      case 'wrong-password':
        return LogInWithFacebookFailure(
          l10n.firebaseLoginFacebookFailureWrongPassword,
        );
      case 'invalid-verification-code':
        return LogInWithFacebookFailure(
          l10n.firebaseLoginFacebookFailureInvalidVerificationCode,
        );
      case 'invalid-verification-id':
        return LogInWithFacebookFailure(
          l10n.firebaseLoginFacebookFailureInvalidVerificationId,
        );
      default:
        return LogInWithFacebookFailure();
    }
  }
}
