import 'dart:convert';

import 'package:api_server_calling/model/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Users> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restful api calling'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: fetchUsers),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          final user = users[index];
          final email = user.email;
          final phone = user.phone;
          final nat = user.nat;
          final color = user.gender == 'male' ? Colors.cyan[300] : Colors.red;
          // final name = user['name']['first'];
          // final imageURL = user['picture']['thumbnail'];
          return ListTile(
            title: Text(user.name.first),
            tileColor: color,
            subtitle: Text(nat),
            trailing: Text(phone),
          );
        },
      ),
    );
  }

  void fetchUsers() async {
    print('fetchUsers called');
    const url = 'https://randomuser.me/api/?results=50';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final transformed = results.map((e) {
      final name = UserName(
          title: e['name']['title'],
          first: e['name']['first'],
          last: e['name']['last']);
      return Users(
          name: name,
          cell: e['cell'],
          phone: e['phone'],
          email: e['email'],
          gender: e['gender'],
          nat: e['nat']);
    }).toList();
    setState(() {
      users = transformed;
    });
    print('fetchUsers completed');
  }
}
