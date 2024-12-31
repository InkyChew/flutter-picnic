part of 'food_edit_cubit.dart';

enum Status {
  adding,
  editing,
  added,
  edited,
  deleted,
  error,
}

class FoodEditState extends Equatable {
  final Food food;
  final List<User> members;
  final String? message;
  final Status status;
  String get title => status == Status.adding ? 'Add' : 'Edit';

  FoodEditState({
    required this.food,
    this.members = const [],
    this.message,
    Status? status,
  }): status = status ?? (food.id == 0 ? Status.adding : Status.editing);

  @override
  List<Object> get props => [food, members, status];

  FoodEditState copyWith({
    Food? food,
    List<User>? members,
    String? message,
    Status? status,
  }) {
    return FoodEditState(
      food: food ?? this.food,
      members: members ?? this.members,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }
}