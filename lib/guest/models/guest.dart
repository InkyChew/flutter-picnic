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

enum InvitationStatus { pending, accepted, rejected }

class Guest {
  final String id;
  final InvitationStatus invitationStatus;
  final DateTime editTime;
  final User user;

  Guest({
    required this.id,
    required this.invitationStatus,
    DateTime? editTime,
    required this.user,
  }) : editTime = editTime ?? DateTime.now();

  // Example of a toJson method for serialization
  Map<String, dynamic> toJson() => {
        'id': id,
        'invitationStatus': invitationStatus.name,
        'editTime': editTime.toIso8601String(),
        'user': user.toJson(),
      };

  // Example of a factory method for deserialization
  factory Guest.fromJson(Map<String, dynamic> json) {
    return Guest(
      id: json['id'],
      invitationStatus: InvitationStatus.values
          .firstWhere((e) => e.name == json['invitationStatus']),
      editTime: DateTime.parse(json['editTime']),
      user: User.fromJson(json['user']),
    );
  }
}
