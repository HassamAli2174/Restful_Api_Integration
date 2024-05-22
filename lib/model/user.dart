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

class User {
  final UserName name;
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserDob dob;
  final UserLocation location;
  User( 
      {required this.location,
        required this.dob,
      required this.name,
      required this.gender,
      required this.email,
      required this.phone,
      required this.cell,
      required this.nat});

  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }
}
