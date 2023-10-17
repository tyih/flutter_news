import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'index.dart';
import '../../pages/index.dart';

class RoutePages {
  static final RouteObserver<Route> observer = RouteObserver();
  static List<String> history = [];
  // 列表
  static List<GetPage> list = [
    GetPage(name: RouteNames.main, page: () => const MainPage(), binding: MainBinding()),
    GetPage(name: RouteNames.systemSplash, page: () => const SplashPage()),
    GetPage(name: RouteNames.homeHomeIndex, page: () => const HomeIndexPage()),
    GetPage(name: RouteNames.msgMsgIndex, page: () => const MessageIndexPage()),
    GetPage(name: RouteNames.myMyIndex, page: () => const MyIndexPage()),
    GetPage(name: RouteNames.newsNewsIndex, page: () => const NewsIndexPage()),
  ];
}
