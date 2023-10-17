import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class NewsIndexPage extends GetView<NewsIndexController> {
  const NewsIndexPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("NewsIndexPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsIndexController>(
      init: NewsIndexController(),
      id: "news_index",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("news_index")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
