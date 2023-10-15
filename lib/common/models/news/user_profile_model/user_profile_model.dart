class UserProfileModel {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? userName;
  String? avatarUrl;

  UserProfileModel(
      {this.id,
      this.email,
      this.firstName,
      this.lastName,
      this.userName,
      this.avatarUrl});

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
        id: json['id'] as int?,
        email: json['email'] as String?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        userName: json['userName'] as String?,
        avatarUrl: json['avatarUrl'] as String?);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'userName': userName,
        'avatarUrl': avatarUrl
      };
}
