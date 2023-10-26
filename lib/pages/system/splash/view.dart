import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  Widget _buildView() {
    return Container(
      color: Colors.yellow,
      child: Text('splash'),);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
        id: 'splash',
        builder: (_) {
      return _buildView();
    });
  }
}
