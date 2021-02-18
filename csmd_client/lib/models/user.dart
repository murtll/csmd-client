class User {
  String id;
  String name;
  String gender;
  DateTime birthDate;
  List<String> interests;

  User({this.id, this.name, this.gender, this.birthDate, this.interests});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['_id'],
        name: json['name'],
        gender: json['gender'],
        birthDate: DateTime.parse(json['birthDate']),
        interests: (json['interests'] as List<dynamic>)
            .map((e) => e.toString())
            .toList());
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'gender': gender,
      'birthDate': birthDate.toString(),
      'interests': interests
    };
  }

  @override
  String toString() =>
      'User { id: $id, name: $name, gender: $gender, birthdate: $birthDate, interests: $interests }';
}
