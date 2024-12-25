import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:picnic/user/models/user.dart';

enum InvitationStatus { pending, accepted, rejected }

class Member extends Equatable {
  final User user;
  final DateTime editTime;
  // enum
  final InvitationStatus invitationStatus;
  Member({
    DateTime? editTime,
    required this.user,
    this.invitationStatus = InvitationStatus.pending,
  }) : editTime = editTime ?? DateTime.now();
  @override
  List<Object> get props => [user, editTime, invitationStatus];

  Member copyWith({
    User? user,
    DateTime? editTime,
    InvitationStatus? invitationStatus,
  }) {
    return Member(
      user: user ?? this.user,
      editTime: editTime ?? this.editTime,
      invitationStatus: invitationStatus ?? this.invitationStatus,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user': user.toMap(),
      'editTime': editTime.millisecondsSinceEpoch,
      'invitationStatus': invitationStatus.index,
    };
  }

  factory Member.fromMap(Map<String, dynamic> map) {
    return Member(
      user: User.fromMap(map['user']),
      editTime: DateTime.fromMillisecondsSinceEpoch(map['editTime']),
      invitationStatus: InvitationStatus.values[map['invitationStatus'] ?? 0],
    );
  }

  String toJson() => json.encode(toMap());

  factory Member.fromJson(String source) => Member.fromMap(json.decode(source));

  @override
  String toString() =>
      'Member(user: $user, editTime: $editTime, invitationStatus: $invitationStatus)';
}
