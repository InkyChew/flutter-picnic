part of 'food_list_cubit.dart';

class FoodListState extends Equatable {
  final List<Food> foods;
  const FoodListState(this.foods);

  @override
  List<Object> get props => [foods];
}
