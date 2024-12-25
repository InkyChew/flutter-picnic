part of 'plan_bloc.dart';

sealed class PlanEvent extends Equatable {
  const PlanEvent();

  @override
  List<Object> get props => [];
}

class LoadPlan extends PlanEvent {
  final int id;

  const LoadPlan({required this.id});

  @override
  List<Object> get props => [id];
}