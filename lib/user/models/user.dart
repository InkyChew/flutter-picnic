class User {
  final String id;
  final String name;
  final String image;
  final String email;

  User({
    required this.id,
    required this.name,
    String? image,
    required this.email,
  }) : image = image ?? 'default.jpg';

  // Example of a toJson method for serialization
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'email': email,
      };

  // Example of a factory method for deserialization
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      email: json['email'],
    );
  }
}
