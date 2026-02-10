import 'package:flutter/foundation.dart';

/// Global locale for MyUiTM (English / Malay). Notify listeners when changed.
class AppLocale extends ChangeNotifier {
  static final AppLocale _instance = AppLocale._();
  static AppLocale get instance => _instance;

  AppLocale._();

  bool _isMalay = true;
  bool get isMalay => _isMalay;

  void setMalay(bool value) {
    if (_isMalay == value) return;
    _isMalay = value;
    notifyListeners();
  }

  void toggle() => setMalay(!_isMalay);
}
