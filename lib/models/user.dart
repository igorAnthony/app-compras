class User {
  int? id;
  String? name;
  String? email;
  String? token;
  String? phone_number;

  User({this.id, this.name, this.email, this.token, this.phone_number});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['user']['id'],
      name: json['user']['name'],
      email: json['user']['email'],
      phone_number: json['user']['phone_number'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "phone_number": phone_number,
      "token": token,
    };
  }
}
