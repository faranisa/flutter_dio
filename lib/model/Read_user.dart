
class ReadUser {
  ReadUser({
      required this.id,
      required this.name,
      required this.email,
      required this.gender,
      required this.status,});

  ReadUser.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    gender = json['gender'];
    status = json['status'];
  }

  late int id;
  late String name;
  late String email;
  late String gender;
  late String status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['gender'] = gender;
    map['status'] = status;
    return map;
  }

  bool contains(String query) {
    if (query.contains(" ")) {
      var queries = query.split(" ");
      print(queries);
      var isContain = false;
      for (var element in queries) {
        isContain = contains(element);
        if(!isContain){
          break;
        }
      }
      return isContain;
    }
    return name
        .toLowerCase()
        .contains(query.toLowerCase());
  }
}