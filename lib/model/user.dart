// put all the simple properties that are with in the array such as
//"gender":"male"
// and do not contain any other properties in them such as name
//"name": {
// "title":"Monsieur",
// "first":"Beat",
// "last":"Bonnet"
// },
import 'package:api_server_calling/model/user_dob.dart';
import 'package:api_server_calling/model/user_location.dart';
import 'package:api_server_calling/model/user_name.dart';
import 'package:api_server_calling/model/user_picture.dart';

class User {
  final UserName name;
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserDob dob;
  final UserLocation location;
  final UserPicture picture;
  User( 
      { required  this.picture,
        required this.location,
      required this.dob,
      required this.name,
      required this.gender,
      required this.email,
      required this.phone,
      required this.cell,
      required this.nat});

  //Factory constructor which will parse the data
  factory User.fromMap(Map<String, dynamic> e) {
    final name = UserName.fromMap(e['name']);
    final dob = UserDob.fromMap(e['dob']);
    final location = UserLocation.fromMap(e['location']);
    final picture = UserPicture.fromMap(e['picture']);
    return User(
      name: name,
      location: location,
      picture: picture,
      dob: dob,
      cell: e['cell'],
      phone: e['phone'],
      email: e['email'],
      gender: e['gender'],
      nat: e['nat'],
    );
  }

  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }
}
