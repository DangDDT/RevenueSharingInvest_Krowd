import 'package:flutter/material.dart';
import 'package:rsi/l10n/support_locale.dart';

class LocaleProvider with ChangeNotifier {
  Locale? _locale;
  Locale? get locale => _locale;
  LocaleProvider() {
    _locale = L10n.support.values.first;
  }

  void setLocale(Locale loc) {
    if (!L10n.support.values.contains(loc)) return;
    _locale = loc;
    notifyListeners();
  }

  void clearLocale() {
    _locale = null;
    notifyListeners();
  }
}
