part of 'plan_bloc.dart';

sealed class PlanState extends Equatable {
  const PlanState();

  @override
  List<Object> get props => [];
}

final class PlanInitial extends PlanState {}

final class PlanLoading extends PlanState {}

final class PlanLoaded extends PlanState {
  final Plan plan;

  const PlanLoaded({required this.plan});

  @override
  List<Object> get props => [plan];
}

class FoodError extends PlanState {
  final String message;

  const FoodError(this.message);

  @override
  List<Object> get props => [message];
}
