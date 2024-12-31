import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picnic/plan/models/models.dart';
import 'package:picnic/user/models/user.dart';

part 'food_edit_state.dart';

class FoodEditCubit extends Cubit<FoodEditState> {
  FoodEditCubit(Food food) : super(FoodEditState(food: food));

  Future<void> getMembers() async {
    String? msg;
    await Future.delayed(const Duration(seconds: 1));
    List<User> members = [
      // User(name: 'Alice', email: ''),
      // User(name: 'Bob', email: ''),
      // User(name: 'Inky', email: '')
    ];
    if (members.isEmpty) {
      msg = 'No participated members.';
    }
    emit(state.copyWith(members: members, message: msg));
  }

  void editFood(Food food) {
    emit(state.copyWith(food: food));
  }

  Future<void> updateFood() async {
    // api
    await Future.delayed(const Duration(seconds: 1));
    if (state.status == Status.adding) {
      emit(state.copyWith(status: Status.added));
    }
    if (state.status == Status.editing) {
      emit(state.copyWith(status: Status.edited));
    }
  }

  Future<void> deleteFood() async {
    // api
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(status: Status.deleted));
  }
}
