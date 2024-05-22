// put all the simple properties that are with in the array such as
//"gender":"male"
// and do not contain any other properties in them such as name
//"name": {
// "title":"Monsieur",
// "first":"Beat",
// "last":"Bonnet"
// },
class Users {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;

  Users(
      {required this.gender,
      required this.email,
      required this.phone,
      required this.cell,
      required this.nat});
}
