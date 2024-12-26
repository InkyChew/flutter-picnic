part of 'food_cubit.dart';

class FoodState extends Equatable {
  final List<Food> foods;
  const FoodState(this.foods);

  @override
  List<Object> get props => [foods];
}

final class FoodInitial extends FoodState {
  const FoodInitial(super.foods);
}
final class FoodUpdated extends FoodState {
  const FoodUpdated(super.foods);
}
