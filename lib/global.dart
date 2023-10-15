import 'package:flutter/material.dart';
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
  }

  static void setSystemUI() {}
}
