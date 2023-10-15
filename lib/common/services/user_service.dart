import 'dart:convert';

import 'package:flutter_news/common/index.dart';
import 'package:get/get.dart';

/// 用户服务
class UserService extends GetxService {
  static UserService get to => Get.find();

  final _isLogin = false.obs;
  String token = '';
  final _profile = UserProfileModel().obs;

  /// 是否登录
  bool get isLogin => _isLogin.value;

  /// 用户信息profile
  UserProfileModel get profile => _profile.value;

  /// 是否有token
  bool get hasToken => token.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    // 读取本地token
    token = Storage().getString(Constants.token);
    // 读取本地profile
    var profileOffline = Storage().getString(Constants.profile);
    if (profileOffline.isNotEmpty) {
      _profile(UserProfileModel.fromJson(jsonDecode(profileOffline)));
    }
  }

  /// 设置profile
  Future<void> setToken(String value) async {
    await Storage().setString(Constants.token, value);
    token = value;
  }

  /// 获取profile
  Future<void> getProfile() async {
    if (token.isEmpty) return;
    // 请求profile
    // UserProfileModel result = await
  }

  /// 设置profile
  Future<void> setProfile(UserProfileModel profile) async {
    if (token.isEmpty) return;
    _isLogin.value = true;
    _profile(profile);
    Storage().setString(Constants.profile, jsonEncode(profile));
  }

  /// 注销
  Future<void> logout() async {
    await Storage().remove(Constants.token);
    _profile(UserProfileModel());
    _isLogin.value = false;
    token = '';
  }

  /// 检查是否登录
  Future<bool> checkIsLogin() async {
    if (_isLogin.value == false) {
      // 跳转到登录页
      // await Get.toNamed(page)
      return false;
    }
    return true;
  }
}
