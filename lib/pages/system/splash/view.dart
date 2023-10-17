import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  Widget _buildView() {
    return const Text('splash');
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(builder: (_) {
      return _buildView();
    });
  }
}
