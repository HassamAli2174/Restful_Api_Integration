import 'package:api_server_calling/model/user.dart';
import 'package:api_server_calling/model/user_name.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserApi {
  static Future<List<User>> fetchUsers() async {
    const url = 'https://randomuser.me/api/?results=50';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final users = results.map((e) {
      final name = UserName(
          title: e['name']['title'],
          first: e['name']['first'],
          last: e['name']['last']);
      return User(
          name: name,
          cell: e['cell'],
          phone: e['phone'],
          email: e['email'],
          gender: e['gender'],
          nat: e['nat']);
    }).toList();
    return users;
  }
}
