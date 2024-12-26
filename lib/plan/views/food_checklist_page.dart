import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picnic/plan/cubit/food_cubit.dart';

import 'package:picnic/plan/models/food.dart';
import 'package:picnic/plan/views/food_edit_page.dart';
import 'package:picnic/user/models/user.dart';

class FoodChecklistPage extends StatelessWidget {
  final User user = User(name: 'Alice', email: '');
  final List<Food> foods;

  FoodChecklistPage({
    super.key,
    required this.foods,
  });

  void _navigateToFoodEditPage(BuildContext context, Food? food) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodEditPage(user: user, foodItem: food),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoodCubit(foods),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Food",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          iconTheme: IconThemeData(
            color: Colors.grey[800],
          ),
        ),
        body: BlocBuilder<FoodCubit, FoodState>(
          builder: (context, state) {
            final foods = state.foods;
            return ListView.builder(
              itemCount: foods.length,
              itemBuilder: (context, index) {
                final food = foods[index];
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  elevation: 2,
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text(food.name)],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Quantity: ${food.quantity}',
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    leading: CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.orange.shade100,
                      child: Text(
                        food.preparedBy.name,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        food.isPrepared
                            ? Icons.check_circle
                            : Icons.radio_button_unchecked,
                        color: food.isPrepared
                            ? Colors.orange
                            : Colors.orange.shade300,
                      ),
                      onPressed: () => context.read<FoodCubit>().updateFoodIsPrepared(food),
                    ),
                    onTap: () => _navigateToFoodEditPage(context, food),
                  ),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => _navigateToFoodEditPage(context, null)),
      ),
    );
  }
}
