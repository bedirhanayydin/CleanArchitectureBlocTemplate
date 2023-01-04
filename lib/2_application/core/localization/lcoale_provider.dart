import 'package:flutter/material.dart';
import 'package:performx/l10n/l10n.dart';

class LocaleProvider extends ChangeNotifier {
  Locale? _locale;
  Locale? get locale => _locale;
  void setLocale(Locale locale) {
    if (!L10n.support.contains(locale)) {
      return;
    }
    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = null;

    notifyListeners();
  }
}
