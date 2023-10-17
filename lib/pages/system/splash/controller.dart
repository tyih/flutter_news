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

  @override
  void onReady() {
    super.onReady();
    _initData();
    // 跳转到主界面
    // _jumpToMain();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  void _jumpToMain() {
    Get.offAllNamed(RouteNames.main);
  }
}
