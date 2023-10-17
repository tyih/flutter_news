import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_news/common/index.dart';
import 'package:get/get.dart';

class Global {
  static Future<void> init() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

    // 系统样式
    setSystemUI();

    // 工具类
    await Storage().init();
    Loading.init();

    // 注入初始化服务
    Get.put<ConfigService>(ConfigService());
    Get.put<HttpService>(HttpService());
    Get.put<UserService>(UserService());
  }

  // 系统样式
  static void setSystemUI() {
    if (GetPlatform.isMobile) {
      // 屏幕方向
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    }

    if (GetPlatform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // 顶部状态栏颜色
        systemNavigationBarDividerColor: Colors.transparent, // 底部状态栏与主内容分割线颜色
        systemNavigationBarColor: Colors.white, // 底部状态栏颜色
        systemNavigationBarIconBrightness: Brightness.dark // 底部状态栏图标样式
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }
}
