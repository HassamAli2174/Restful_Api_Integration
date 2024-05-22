class UserLocation {
  final String city;
  final String state;
  final String country;
  final String postcode;
  final LocationCoordinates coordinates;
  final LocationTimezone timezone;
  final LocationStreet street;

  UserLocation(
      {required this.city,
      required this.state,
      required this.country,
      required this.postcode,
      required this.coordinates,
      required this.timezone,
      required this.street});
}

class LocationStreet {
  final int number;
  final String name;

  LocationStreet({required this.number, required this.name});
}

class LocationCoordinates {
  final String latitude;
  final String longitude;

  LocationCoordinates({required this.latitude, required this.longitude});
}

class LocationTimezone {
  final String offset;
  final String description;

  LocationTimezone({required this.offset, required this.description});
}
