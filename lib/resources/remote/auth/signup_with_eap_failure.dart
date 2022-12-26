import 'package:rsi/l10n/support_locale.dart';

class SignUpWithEmailAndPasswordFailure implements Exception {
  late final String? message;

  SignUpWithEmailAndPasswordFailure([this.message]) {
    final l10n = L10n.useL10n();
    this.message ??= l10n.unknownExceptionOccurred;
  }

  factory SignUpWithEmailAndPasswordFailure.fromCode(String code) {
    final l10n = L10n.useL10n();
    switch (code) {
      case 'invalid-email':
        return SignUpWithEmailAndPasswordFailure(
          l10n.firebaseSignupEAPFailureInvalidEmail,
        );
      case 'user-disabled':
        return SignUpWithEmailAndPasswordFailure(
          l10n.firebaseSignupEAPFailureUserDisabled,
        );
      case 'email-already-in-use':
        return SignUpWithEmailAndPasswordFailure(
          l10n.firebaseSignupEAPFailureEmailAlreadyInUse,
        );
      case 'operation-not-allowed':
        return SignUpWithEmailAndPasswordFailure(
          l10n.firebaseSignupEAPFailureOperationNotAllowed,
        );
      case 'weak-password':
        return SignUpWithEmailAndPasswordFailure(
          l10n.firebaseSignupEAPFailureWeakPassword,
        );
      default:
        return SignUpWithEmailAndPasswordFailure();
    }
  }
}
