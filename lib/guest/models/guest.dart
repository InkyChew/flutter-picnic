import 'package:picnic/user/models/user.dart';

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
