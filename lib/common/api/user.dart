import '../index.dart';

/// 用户接口
class UserApi {
  /// 注册
  static Future<bool> register(UserRegisterReq? req) async {
    var res = await HttpService.to.post('/users/register', data: req);
    if (res.statusCode == 201) {
      return true;
    }
    return false;
  }

  /// 登录
  static Future<UserTokenModel> login(UserLoginReq? req) async {
    var res = await HttpService.to.post('/users/login', data: req);
    return UserTokenModel.fromJson(res.data);
  }

  /// 获取profile
  static Future<UserProfileModel> profile() async {
    var res = await HttpService.to.get('/users/me');
    return UserProfileModel.fromJson(res.data);
  }

  /// 保存用户信息
  static Future<UserProfileModel> saveUserInfo(UserProfileModel req) async {
    var res = await HttpService.to.put('/users/me', data: {
      'first_name': req.firstName,
      'last_name': req.lastName,
      'email': req.email
    });
    return UserProfileModel.fromJson(res.data);
  }
}
