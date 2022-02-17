import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    required this.name,
    required this.instansi,
    required this.avatar,
    required this.email,
    required this.password,
    required this.role,
    required this.phone,
  });

  String name;
  String instansi;
  String avatar;
  String email;
  String password;
  String role;
  String phone;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        name: json["name"],
        instansi: json["instansi"],
        avatar: json["avatar"],
        email: json["email"],
        password: json["password"],
        role: json["role"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "instansi": instansi,
        "avatar": avatar,
        "email": email,
        "password": password,
        "role": role,
        "phone": phone,
      };
}
