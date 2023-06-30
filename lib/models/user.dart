class User {
  int? id;
  String? name;
  String? email;
  String? token;
  String? phoneNumber;

  User({this.id, this.name, this.email, this.token, this.phoneNumber});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['user']['id'],
      name: json['user']['name'],
      email: json['user']['email'],
      phoneNumber: json['user']['phone_number'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "phone_number": phoneNumber,
      "token": token,
    };
  }
}
