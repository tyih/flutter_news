import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_news/common/routers/index.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  SplashController();

  _initData() {
    update(["splash"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  void _jumpToMain() {
    Future.delayed(Duration(seconds: 3), (){
      Get.offAllNamed(RouteNames.main);
    });
  }

  @override
  void onReady() {
    super.onReady();
    // _initData();
    // 删除设备启动图，解决启动开头白屏问题
    FlutterNativeSplash.remove();
    // 跳转到主界面
    _jumpToMain();
  }
}
