part of 'food_edit_cubit.dart';

class FoodEditState extends Equatable {
  final Food food;
  final List<User> members;
  final String? message;

  const FoodEditState({
    required this.food,
    this.members = const [],
    this.message,
  });

  @override
  List<Object> get props => [food, members];

  FoodEditState copyWith({
    Food? food,
    List<User>? members,
    String? message,
  }) {
    return FoodEditState(
      food: food ?? this.food,
      members: members ?? this.members,
      message: message ?? this.message,
    );
  }
}
