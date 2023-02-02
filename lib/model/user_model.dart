class UserModel {
  String? userId, name, email, password;

  UserModel({required this.userId, required this.name, required this.email, required this.password});

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    userId = map['userId'];
    name = map['name'];
    email = map['email'];
    password=map['password'];
  }

  toJson() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
