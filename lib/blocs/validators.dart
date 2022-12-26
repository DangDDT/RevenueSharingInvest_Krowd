import 'dart:core';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rsi/l10n/support_locale.dart';

class Validators {
  static final RegExp emailRegex =
      new RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  late final AppLocalizations l10n;
  Validators() {
    l10n = L10n.useL10n();
  }
  String? emailValid(String email) {
    String? errorMessage;
    // ignore: unnecessary_null_comparison
    if (email == null || email == "") {
      errorMessage = l10n.emailRequired;
    } else if (!emailRegex.hasMatch(email)) {
      errorMessage = l10n.emailInputInvalid;
    }
    return errorMessage;
  }

  String? passwordValid(String password) {
    String? errorMessage;
    // ignore: unnecessary_null_comparison
    if (password == null || password == "") {
      errorMessage = l10n.passwordRequired;
    } else if (password.length < 8 || password.length > 25) {
      errorMessage = l10n.passwordInputMoreThan8Characters;
    }
    return errorMessage;
  }

  String? requiredValid(String requiredString) {
    String? errorMessage;
    // ignore: unnecessary_null_comparison
    if (requiredString == null || requiredString == "") {
      errorMessage = l10n.dataInputRequired;
    }
    return errorMessage;
  }

  String? confirmPasswordValid(String password, String confirmPassword) {
    String? errorMessage;
    // ignore: unnecessary_null_comparison
    if (password == null || password == "") {
      errorMessage = l10n.dataInputRequired;
    } else if (password != confirmPassword) {
      errorMessage = l10n.confirmPasswordInputDoesNotMatch;
    }
    return errorMessage;
  }
}
