import 'package:flutter/foundation.dart';

/// Global locale for UiTM+ (English / Malay). Notify listeners when changed.
class AppLocale extends ChangeNotifier {
  static final AppLocale _instance = AppLocale._();
  static AppLocale get instance => _instance;

  AppLocale._();

  bool _isMalay = false;
  bool get isMalay => _isMalay;

  void setMalay(bool value) {
    if (_isMalay == value) return;
    _isMalay = value;
    notifyListeners();
  }

  void toggle() => setMalay(!_isMalay);
}
