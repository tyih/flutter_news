import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_news/common/index.dart';
import 'package:flutter_news/pages/home/home_index/index.dart';
import 'package:flutter_news/pages/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _MainViewGetX();
  }
}

class _MainViewGetX extends GetView<MainController> {
  const _MainViewGetX({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    DateTime? lastPressedAt;
    return WillPopScope(
        child: Scaffold(
          extendBody: true,
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: GetBuilder<MainController>(
            id: 'navigation',
            builder: (controller) {
            return BuildNavigation(
                currentIndex: controller.currentIndex,
                items: [
                  NavigationItemModel(
                    label: LocaleKeys.tabBarHome.tr,
                    icon: AssetsSvgs.navHomeSvg,
                  ),
                  NavigationItemModel(
                    label: LocaleKeys.tabBarNews.tr,
                    icon: AssetsSvgs.navNewsSvg,
                  ),
                  NavigationItemModel(
                    label: LocaleKeys.tabBarMessage.tr,
                    icon: AssetsSvgs.navMessageSvg,
                  ),
                  NavigationItemModel(
                    label: LocaleKeys.tabBarProfile.tr,
                    icon: AssetsSvgs.navProfileSvg,
                  ),
                ],
                onTap: controller.onJumpToPage);
          }),
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller.pageController,
            onPageChanged: controller.onIndexChanged,
            children: const [
              HomeIndexPage(),
              NewsIndexPage(),
              MessageIndexPage(),
              MyIndexPage()
            ],
          ),
        ),
        onWillPop: () async {
          // 连续点击两次退出
          if (lastPressedAt == null ||
              DateTime.now().difference(lastPressedAt!) >
                  const Duration(seconds: 1)) {
            lastPressedAt = DateTime.now();
            Loading.toast('再按一次退出');
            return false;
          }
          await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          return true;
        });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      id: "main",
      builder: (_) => _buildView(),
    );
  }
}
