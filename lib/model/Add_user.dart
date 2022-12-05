import 'dart:convert';

AddUser addUserFromJson(String str) => AddUser.fromJson(json.decode(str));

String addUserToJson(AddUser data) => json.encode(data.toJson());

class AddUser {
  AddUser({
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.status,
  });

  int id;
  String name;
  String email;
  String gender;
  String status;

  factory AddUser.fromJson(Map<String, dynamic> json) => AddUser(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    gender: json["gender"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "gender": gender,
    "status": status,
  };
}
