part of 'guest_cubit.dart';

enum Status {
  loading,
  success,
}

class GuestState extends Equatable {
  final List<Member> members;
  final Status status;

  const GuestState({required this.members, this.status = Status.success});

  @override
  List<Object> get props => [members, status];

  GuestState copyWith({
    List<Member>? members,
    Status? status,
  }) {
    return GuestState(
      members: members ?? this.members,
      status: status ?? this.status,
    );
  }
}
