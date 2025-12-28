class UserModel {
  String? name;
  String? phone;
  String? email;
  String? token;

  UserModel({
    this.name,
    this.phone,
    this.email,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json["name"],
      phone: json["phone"],
      email: json["email"],
      token: json["token"],
    );
  }
}
