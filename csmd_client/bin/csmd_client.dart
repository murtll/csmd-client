import 'package:csmd_client/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => startApp();

void startApp() async {
  final user = User(
      name: 'Gaytem',
      gender: 'M',
      birthDate: DateTime.now(),
      interests: ['xui', 'pizda', 'piska']);

  await addUser(user);

  final users = await getUsers();
  users.forEach((element) {
    print(element);
  });
}

void addUser(User user) async {
  var response;

  try {
    // print(json.encode(user.toJson()));
    // print(json.encode(user));

    response = await http.post('http://localhost:8080/users/add',
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({
          "username": "Naxy03",
          "email": "esskeetiter@gmail.com",
          "password": "bubun2345"
        }));

    if (response.statusCode != 200) {
      print(
          'http://localhost:8080/api/users/add returned ${response.statusCode}');
      print('Error: ${response.body}');
      return;
    }

    print('User added: ${response.body}');
  } catch (e) {
    print(e);
  }
}

Future<List<User>> getUsers() async {
  var userJson;
  try {
    userJson = await http.get('http://localhost:8080/api/users');

    if (userJson.statusCode != 200) {
      print('http://localhost:8080/api/users returned ${userJson.statusCode}');
      return [];
    }
  } catch (e) {
    print(e);
    return [];
  }
  List data = json.decode(userJson.body);
  return data.map((e) => User.fromJson(e)).toList();
}
