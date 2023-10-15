import 'dart:ui';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'locales/locale_en.dart';
import 'locales/locale_zh.dart';

class Translation extends Translations {
  // 默认语言
  static const fallbackLocale = Locale('en', 'US');

  // 支持语言列表
  static const supportedLocales = [Locale('en', 'US'), Locale('zh', 'CN')];

  // 语音代码对应翻译
  @override
  Map<String, Map<String, String>> get keys => {'en': localeEn, 'zh': localeZh};

  // 代理
  static const localizationsDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate
  ];
}
