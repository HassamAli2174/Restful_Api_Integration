import 'dart:html';

import 'package:api_server_calling/model/user.dart';
import 'package:api_server_calling/model/user_dob.dart';
import 'package:api_server_calling/model/user_location.dart';
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
      final date = e['dob']['date'];
      final dob = UserDob(date: DateTime.parse(date), age: e['dob']['age']);
      final coordinate = LocationCoordinates(
          latitude: e['location']['coordinates']['latitude'],
          longitude: e['location']['coordinates']['longitude']);
      final timezone = LocationTimezone(
          offset: e['location']['timezone']['offset'],
          description: e['location']['timezone']['description']);
      final street = LocationStreet(
          number: e['location']['street']['number'],
          name: e['location']['street']['name']);
      final location = UserLocation(
          city: e['location']['city'],
          state: e['location']['state'],
          country: e['location']['country'],
          postcode: e['location']['postcode']
              .toString(), //some postcode are string as well
          coordinates: coordinate,
          timezone: timezone,
          street: street);
      return User(
        name: name,
        location: location,
        dob: dob,
        cell: e['cell'],
        phone: e['phone'],
        email: e['email'],
        gender: e['gender'],
        nat: e['nat'],
      );
    }).toList();
    return users;
  }
}
