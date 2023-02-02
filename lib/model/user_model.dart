class UserModel {
  String userId, name, email, password;

  UserModel({required this.userId, required this.name, required this.email, required this.password});


  toJson() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
