class UserLoginReq {
  String? _userName;
  String? _password;

  UserLoginReq({String? userName, String? password}) {
    _userName = userName;
    _password = password;
  }

  UserLoginReq copyWith({
    String? userName,
    String? password
  }) =>
      UserLoginReq(
          userName: userName ?? _userName, password: password ?? _password);

  String? get userName => _userName;

  String? get password => _password;

  UserLoginReq.fromJson(dynamic json) {
    _userName = json['username'];
    _password = json['password'];
  }

  Map<String, dynamic> toJson() =>
      {
        'username': _userName,
        'password': _password
      };
}