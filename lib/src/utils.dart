import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../local_provider.dart';

class LanguageSetting {
  String _getLanguageTitle(String languageCode) {
    switch (languageCode) {
      case 'id':
        return "Indonesia";
      default:
        return "English";
    }
  }

  void setLocale(String languageCode, WidgetRef ref) {
    switch (languageCode) {
      case 'id':
        ref.read(localeProvider).setLocale(const Locale('id', 'ID'));
        return;
      default:
        ref.read(localeProvider).setLocale(const Locale('en', 'US'));
        return;
    }
  }
}
