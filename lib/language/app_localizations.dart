import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  late Map<String, String> _localizedStrings;

  void _loadLocalizedStrings() {
    final Map<String, Map<String, String>> localizedStrings = {
      'en': {
        'settings': 'Settings',
        'account': 'Account',
        'user': 'User',
        'admin': 'Admin',
        'language': 'Language',
        'notification': 'Notification',
        'dark_mode': 'Dark Mode',
        'help': 'Help',
        'email': 'Email',
        'dob': 'Date of Birth',
        'gender': 'Gender',
        'add_avatar': 'Add Avatar',
        'log_out' : 'Log out', // Thêm chuỗi văn bản này
      },
      'vi': {
        'settings': 'Cài đặt',
        'account': 'Tài khoản',
        'user': 'Người dùng',
        'admin': 'Quản trị viên',
        'language': 'Ngôn ngữ',
        'notification': 'Thông báo',
        'dark_mode': 'Chế độ tối',
        'help': 'Trợ giúp',
        'email': 'Email',
        'dob': 'Ngày sinh',
        'gender': 'Giới tính',
        'add_avatar': 'Thêm Avatar', // Thêm chuỗi văn bản này
        'log_out' : 'Thoát tài khoản',
      },
    };

    _localizedStrings = localizedStrings[locale.languageCode]!;
  }

  String get settings => _localizedStrings['settings']!;
  String get account => _localizedStrings['account']!;
  String get user => _localizedStrings['user']!;
  String get admin => _localizedStrings['admin']!;
  String get language => _localizedStrings['language']!;
  String get notification => _localizedStrings['notification']!;
  String get darkMode => _localizedStrings['dark_mode']!;
  String get help => _localizedStrings['help']!;
  String get email => _localizedStrings['email']!;
  String get dob => _localizedStrings['dob']!;
  String get gender => _localizedStrings['gender']!;
  String get addAvatar => _localizedStrings['add_avatar']!; // Thêm getter này
  String get logout => _localizedStrings['log_out']!;

}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'vi'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    final appLocalizations = AppLocalizations(locale);
    appLocalizations._loadLocalizedStrings();
    return SynchronousFuture<AppLocalizations>(appLocalizations);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
