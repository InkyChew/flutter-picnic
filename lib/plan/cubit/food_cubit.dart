import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picnic/plan/models/models.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit(List<Food> foods) : super(FoodState(foods));

  void updateFoodIsPrepared(Food food) {
    List<Food> updatedFoods = List.from(state.foods);
    int i = updatedFoods.indexOf(food); // index where id
    if (i != -1) {
      updatedFoods[i] = food.copyWith(isPrepared: !food.isPrepared);
      emit(FoodState(updatedFoods));
    }
  }

  void updateFood(Food food) {
    List<Food> updatedFoods = List.from(state.foods);
    int i = updatedFoods.indexOf(food); // index where id
    if (i != -1) {
      updatedFoods[i] = food.copyWith(
          name: food.name,
          quantity: food.quantity,
          description: food.description,
          isPrepared: !food.isPrepared);
      emit(FoodState(updatedFoods));
    }
  }

  void addFood(Food food) {
    List<Food> updatedFoods = List.from(state.foods);
    updatedFoods.add(food);
    emit(FoodState(updatedFoods));
  }

  void removeFood(Food food) {
    List<Food> updatedFoods = List.from(state.foods);
    updatedFoods.remove(food);
    emit(FoodState(updatedFoods));
  }
}
