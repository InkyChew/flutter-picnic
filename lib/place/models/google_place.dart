class Place {
  final String id;
  final String formattedAddress;
  final Location location;
  final String displayName;

  Place({
    required this.id,
    required this.formattedAddress,
    required this.location,
    required this.displayName,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      id: json['id'] as String,
      formattedAddress: json['formattedAddress'] as String,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      displayName: json['displayName']['text'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'formattedAddress': formattedAddress,
      'location': location.toJson(),
      'displayName': displayName,
    };
  }
}

class Location {
  final double latitude;
  final double longitude;

  Location({
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
