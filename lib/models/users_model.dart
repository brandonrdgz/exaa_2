class UsersModel {
  UsersModel({
    required this.email,
    required this.username
  });

  String email;
  String username;

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        email: json["email"],
        username: json["username"]
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "username": username
      };
}