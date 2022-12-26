import 'package:rsi/l10n/support_locale.dart';

class LogInWithGoogleFailure implements Exception {
  late final String? message;

  LogInWithGoogleFailure([this.message]) {
    final l10n = L10n.useL10n();
    this.message ??= l10n.unknownExceptionOccurred;
  }

  factory LogInWithGoogleFailure.fromCode(String code) {
    final l10n = L10n.useL10n();
    switch (code) {
      case 'account-exists-with-different-credential':
        return LogInWithGoogleFailure(
          l10n.firebaseLoginGoogleFailureAccountExisted,
        );
      case 'invalid-credential':
        return LogInWithGoogleFailure(
          l10n.firebaseLoginGoogleFailureInvalidEmail,
        );
      case 'operation-not-allowed':
        return LogInWithGoogleFailure(
          l10n.firebaseLoginGoogleFailureOperationNotAllowed,
        );
      case 'user-disabled':
        return LogInWithGoogleFailure(
          l10n.firebaseLoginGoogleFailureUserDisabled,
        );
      case 'user-not-found':
        return LogInWithGoogleFailure(
          l10n.firebaseLoginGoogleFailureUserNotFound,
        );
      case 'wrong-password':
        return LogInWithGoogleFailure(
            L10n.useL10n().firebaseLoginGoogleFailureWrongPassword);
      case 'invalid-verification-code':
        return LogInWithGoogleFailure(
          l10n.firebaseLoginGoogleFailureInvalidVerificationCode,
        );
      case 'invalid-verification-id':
        return LogInWithGoogleFailure(
          l10n.firebaseLoginGoogleFailureInvalidVerificationId,
        );
      default:
        return LogInWithGoogleFailure();
    }
  }
}
