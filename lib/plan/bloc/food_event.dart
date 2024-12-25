part of 'food_bloc.dart';

sealed class FoodEvent extends Equatable {
  const FoodEvent();

  @override
  List<Object?> get props => [];
}

class LoadFoods extends FoodEvent {
  final String? cuisine;
  final String? diet;
  final int? maxCalories;

  const LoadFoods({this.cuisine, this.diet, this.maxCalories});

  @override
  List<Object?> get props => [cuisine, diet, maxCalories];
}