import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picnic/plan/models/member.dart';

part 'guest_state.dart';

class GuestCubit extends Cubit<GuestState> {
  GuestCubit(List<Member> members) : super(GuestState(members: members));

  Future<void> addMember(Member member) async {
    emit(state.copyWith(status: Status.loading));
    // api
    await Future.delayed(const Duration(seconds: 3));
    List<Member> updatedMembers = List.from(state.members);
    updatedMembers.add(member);
    emit(state.copyWith(members: updatedMembers, status: Status.success));
  }

  Future<void> deleteMember(Member member) async {
    emit(state.copyWith(status: Status.loading));
    // api
    await Future.delayed(const Duration(seconds: 3));
    List<Member> updatedMembers = List.from(state.members);
    updatedMembers.remove(member);
    emit(state.copyWith(members: updatedMembers, status: Status.success));
  }
}
