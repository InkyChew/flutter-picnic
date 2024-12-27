import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picnic/plan/models/models.dart';

part 'food_list_state.dart';

class FoodListCubit extends Cubit<FoodListState> {

  FoodListCubit(List<Food> foods) : super(FoodListState(foods));

  void updateFoodIsPrepared(Food food) {
    List<Food> updatedFoods = List.from(state.foods);
    int i = updatedFoods.indexOf(food); // index where id
    if (i != -1) {
      updatedFoods[i] = food.copyWith(isPrepared: !food.isPrepared);
      emit(FoodListState(updatedFoods));
    }
  }

  void updateFoodList(Food food) {
    List<Food> updatedFoods = List.from(state.foods);
    int i = updatedFoods.indexOf(food); // index where id
    if (i != -1) {
      updatedFoods[i] = food.copyWith(
          name: food.name,
          quantity: food.quantity,
          description: food.description,
          isPrepared: food.isPrepared);
      emit(FoodListState(updatedFoods));
    }
  }

  Future<void> addFood(Food food) async {
    // api
    await Future.delayed(const Duration(seconds: 3));
    List<Food> updatedFoods = List.from(state.foods);
    updatedFoods.add(food);
    emit(FoodListState(updatedFoods));
  }

  Future<void> deleteFood(Food food) async {
    // api
    await Future.delayed(const Duration(seconds: 3));
    List<Food> updatedFoods = List.from(state.foods);
    updatedFoods.remove(food);
    emit(FoodListState(updatedFoods));
  }
}
