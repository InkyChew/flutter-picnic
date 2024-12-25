import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picnic/plan/bloc/plan_bloc.dart';
import 'package:picnic/plan/views/plan_page.dart';

class PlanApp extends StatelessWidget {
  const PlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PlanBloc()..add(const LoadPlan(id: 1)),
      child: const PlanPage(),
    );
  }
}