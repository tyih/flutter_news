import 'package:flutter_news/pages/index.dart';
import 'package:get/get.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeIndexController>(() => HomeIndexController());
    Get.lazyPut<NewsIndexController>(() => NewsIndexController());
    Get.lazyPut<MessageIndexController>(() => MessageIndexController());
    Get.lazyPut<MyIndexController>(() => MyIndexController());
    Get.lazyPut<MainController>(() => MainController());
  }
}