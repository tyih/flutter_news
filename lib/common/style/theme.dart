import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_news/common/style/color_schemes.g.dart';

/// 主题
class AppTheme {
  /// 亮色
  static ThemeData light = ThemeData(
      colorScheme: lightColorScheme,
      fontFamily: 'Montserrat',
      appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Color(0xFF5F84FF)),
          titleTextStyle: TextStyle(
              color: Color(0xFF4D4D4D),
              fontSize: 24,
              fontWeight: FontWeight.w600)));

  /// 暗色
  static ThemeData dark = ThemeData(
      colorScheme: darkColorScheme,
      fontFamily: 'Montserrat',
      appBarTheme: AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.light));
}
