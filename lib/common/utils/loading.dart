import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Loading {
  static const int _milliseconds = 500;
  static const int _dismissMilliseconds = 2000;

  static void init() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: _milliseconds)
      ..displayDuration = const Duration(milliseconds: _dismissMilliseconds)
      ..indicatorType = EasyLoadingIndicatorType.ring
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 35.0
      ..lineWidth = 2.0
      ..radius = 10.0
      ..progressColor = Colors.white
      ..backgroundColor = Colors.black.withOpacity(0.7)
      ..indicatorColor = Colors.white
      ..textColor = Colors.white
      ..maskColor = Colors.black.withOpacity(0.6)
      ..userInteractions = true
      ..dismissOnTap = false;
  }

  /// 显示
  static void show([String? text]) {
    EasyLoading.instance.userInteractions = false;
    EasyLoading.show(status: text ?? 'Loading...');
  }

  /// 错误
  static void error([String? text]) {
    Future.delayed(const Duration(milliseconds: _milliseconds),
        () => EasyLoading.showError(text ?? 'Error'));
  }

  /// 成功
  static void success([String? text]) {
    Future.delayed(const Duration(milliseconds: _milliseconds),
        () => EasyLoading.showSuccess(text ?? 'Success'));
  }

  /// toast
  static void toast(String text) {
    Future.delayed(const Duration(milliseconds: _milliseconds),
        () => EasyLoading.showToast(text));
  }

  /// 关闭
  static Future<void> dismiss() async {
    await Future.delayed(const Duration(milliseconds: _dismissMilliseconds),
        () {
      EasyLoading.instance.userInteractions = true;
      EasyLoading.dismiss();
    });
  }
}
