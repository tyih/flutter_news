import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../index.dart';

/// 导航栏数据模型
class NavigationItemModel {
  final String label;
  final String icon;
  final int count;

  NavigationItemModel({
    required this.label,
    required this.icon,
    this.count = 0,
  });
}

/// 导航栏
class BuildNavigation extends StatelessWidget {
  final int currentIndex;
  final List<NavigationItemModel> items;
  final Function(int) onTap;

  const BuildNavigation(
      {Key? key,
      required this.currentIndex,
      required this.items,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ws = <Widget>[];
    for (var i = 0; i < items.length; i++) {
      var color = (i == currentIndex) ? AppColors.primary : null;
      var item = items[i];
      ws.add(
        <Widget>[
          // 图标
          IconWidget.svg(
            item.icon,
            size: 20,
            color: color,
            badgeString: item.count > 0 ? item.count.toString() : null,
          ).paddingBottom(2),
          // 文字
          TextWidget.body1(
            item.label.tr,
            color: color,
          ),
        ]
            .toColumn(
              // 修复底部导航穿透问题
              // mainAxisSize: MainAxisSize.min, // bug: 该行导致底部导航穿透问题
              mainAxisAlignment: MainAxisAlignment.center, // 居中
              mainAxisSize: MainAxisSize.max, // 撑满
            )
            .onTap(() => onTap(i))
            .expanded(),
      );
    }
    return BottomAppBar(
      color: AppColors.surface,
      child: ws
          .toRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
          )
          .height(kBottomNavigationBarHeight),
    );
  }
}
