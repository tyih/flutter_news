import 'dart:ui';

import 'package:flutter_news/common/i18n/translation.dart';
import 'package:flutter_news/common/index.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// 配置 多语言、主题等
class ConfigService extends GetxService {
  static ConfigService get to => Get.find();

  PackageInfo? _platform;

  String get version => _platform?.version ?? '-';

  // 多语言
  Locale locale = PlatformDispatcher.instance.locale;

  // 主题
  final RxBool _isDarkModel = Get.isDarkMode.obs;

  bool get isDarkModel => _isDarkModel.value;

  // 是否首次打开
  bool get isFirstOpen => Storage().getBool(Constants.firstOpen);

  @override
  void onReady() {
    super.onReady();
    getPlatform();
    initLocale();
    initTheme();
  }

  Future<void> getPlatform() async {
    _platform = await PackageInfo.fromPlatform();
  }

  /// 标记已打开app
  void setAlreadyOpen() {
    Storage().setBool(Constants.firstOpen, true);
  }

  /// 初始化主题
  void initTheme() {
    var themeCode = Storage().getString(Constants.themeCode);
    _isDarkModel.value = themeCode == 'dark' ? true : false;
    Get.changeTheme(themeCode == 'dark' ? AppTheme.dark : AppTheme.light);
  }

  /// 切换主题
  Future<void> switchThemeModel() async {
    _isDarkModel.value = !_isDarkModel.value;
    Get.changeTheme(_isDarkModel.value ? AppTheme.dark : AppTheme.light);
    await Storage()
        .setString(Constants.themeCode, _isDarkModel.value ? 'dark' : 'light');
  }

  /// 初始化语言
  void initLocale() {
    var langCode = Storage().getString(Constants.languageCode);
    if (langCode.isEmpty) {
      return;
    }
    var index = Translation.supportedLocales
        .indexWhere((element) => element.languageCode == langCode);
    if (index < 0) {
      return;
    }
    locale = Translation.supportedLocales[index];
  }

  /// 更改语言
  void switchLocale(Locale value) {
    locale = value;
    Get.updateLocale(value);
    Storage().setString(Constants.languageCode, value.languageCode);
  }
}
