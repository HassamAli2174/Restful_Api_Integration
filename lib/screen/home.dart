import 'package:api_server_calling/model/user.dart';
import 'package:api_server_calling/services/user_api.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> users = [];
  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restful api calling'),
      ),
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
            title: Text(user.fullName),
            // tileColor: color,
            subtitle: Text(user.location.postcode),
            trailing: Text(phone),
          );
        },
      ),
    );
  }

  Future<void> fetchUsers() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }
}
