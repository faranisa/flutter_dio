
class UpdateUser {
  UpdateUser({
      required this.email,
      required this.name,
      required this.gender,
      required this.status,
      required this.id,});

  UpdateUser.fromJson(dynamic json) {
    email = json['email'];
    name = json['name'];
    gender = json['gender'];
    status = json['status'];
    id = json['id'];
  }

  late String email;
  late String name;
  late String gender;
  late String status;
  late int id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['name'] = name;
    map['gender'] = gender;
    map['status'] = status;
    map['id'] = id;
    return map;
  }

}