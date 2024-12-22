class Place {
  final int id;
  final String name;
  final String description;
  final String address;
  final double latitude;
  final double longitude;
  final List<String>
      amenities; // e.g., ["Restrooms", "Parking", "Picnic Tables"]
  final List<String> photos; // photo by my users
  final double? rating;      // rate by my users
  final int? reviewsCount;
  // 平均消費金額

  Place({
    required this.id,
    required this.name,
    required this.description,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.amenities,
    required this.photos,
    this.rating,
    this.reviewsCount,
  });

  // Factory method for creating a Place object from JSON
  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      address: json['address'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      amenities: List<String>.from(json['amenities']),
      photos: List<String>.from(json['photos']),
      rating: json['rating']?.toDouble(),
      reviewsCount: json['reviewsCount'],
    );
  }

  // Method to convert a Place object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'amenities': amenities,
      'photos': photos,
      'rating': rating,
      'reviewsCount': reviewsCount,
    };
  }
}
