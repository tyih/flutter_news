/// 用户注册请求
class UserRegisterReq {
  String? userName;
  String? password;
  String? email;
  String? firstName;
  String? lastName;

  UserRegisterReq({
    this.userName,
    this.password,
    this.email,
    this.firstName,
    this.lastName
  });

  factory UserRegisterReq.fromJson(Map<String, dynamic> json) {
    return UserRegisterReq(
        userName: json['username'] as String?,
        password: json['password'] as String?,
        email: json['email'] as String?,
        firstName: json['firstname'] as String?,
        lastName: json['lastname'] as String?
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'username': userName,
        'password': password,
        'email': email,
        'firstname': firstName,
        'lastname': lastName
      };
}