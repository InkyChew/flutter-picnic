import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picnic/plan/models/models.dart';
import 'package:picnic/user/models/user.dart';

part 'plan_event.dart';
part 'plan_state.dart';

class PlanBloc extends Bloc<PlanEvent, PlanState> {
  PlanBloc() : super(PlanInitial()) {
    on<LoadPlan>(getPlan);
    on<UpdatePlan>(updatePlan);
  }

  void getPlan(event, emit) {
    emit(PlanLoading());

    try {
      final Plan plan = Plan(title: 'Time with wild', members: [
        Member(user: User(name: 'Amy', email: '')),
        Member(user: User(name: 'Bob', email: '')),
        Member(user: User(name: 'Alice', email: '')),
      ], foods: [
        Food(
            id: 1,
            planId: 1,
            name: 'Sandwich',
            preparedBy: User(name: 'Alice', email: ''),
            quantity: 10,
            isPrepared: true,
            description: "bob donot eat meat oh no say cheese good taste"),
        Food(
            id: 2,
            planId: 1,
            name: 'Juice',
            preparedBy: User(name: 'Alice', email: ''),
            quantity: 5,
            isPrepared: false),
        Food(
            id: 3,
            planId: 1,
            name: 'Chips',
            preparedBy: User(name: 'Alice', email: ''),
            quantity: 3,
            isPrepared: true),
      ], tools: [
        Tool(
            id: 1,
            planId: 1,
            name: 'Mat',
            preparedBy: User(name: 'Alice', email: ''),
            quantity: 10,
            isPrepared: true,
            description: "bob donot eat meat oh no say cheese good taste"),
        Tool(
            id: 2,
            planId: 1,
            name: 'Music',
            preparedBy: User(name: 'Alice', email: ''),
            quantity: 5,
            isPrepared: false),
        Tool(
            id: 3,
            planId: 1,
            name: 'Lights',
            preparedBy: User(name: 'Alice', email: ''),
            quantity: 3,
            isPrepared: true),
      ]);

      emit(PlanLoaded(plan: plan));
    } catch (e) {
      emit(PlanError('Failed to load plan: $e'));
    }
  }

  void updatePlan(event, emit) {
    emit(PlanLoaded(plan: event.plan));
  }
}
