import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picnic/plan/cubit/food_edit_cubit.dart';
import 'package:picnic/plan/cubit/food_list_cubit.dart';
import 'package:picnic/user/models/user.dart';

import '../models/models.dart';

class FoodEditPage extends StatelessWidget {
  final Food food;
  const FoodEditPage({super.key, required this.food});

  static List<DropdownMenuEntry<User>> generateGuestEntry(List<User> members) {
    return members.map<DropdownMenuEntry<User>>((User guest) {
      return DropdownMenuEntry<User>(
        value: guest,
        label: guest.name,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoodEditCubit(food)..getMembers(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.grey[800],
          ),
          actions: [
            IconButton(
                tooltip: 'delete',
                onPressed: () => context.read<FoodListCubit>().deleteFood(food),
                icon: const Icon(Icons.delete)),
          ],
        ),
        body: BlocConsumer<FoodEditCubit, FoodEditState>(
          listenWhen: (previous, current) =>
              previous.message != current.message,
          listener: (context, state) {
            if (state.message != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${state.message}')),
              );
            }
          },
          builder: (context, state) {
            return ListView(
              padding: const EdgeInsets.all(12.0),
              children: [
                TextFormField(
                  initialValue: food.name,
                  decoration: const InputDecoration(
                    labelText: 'Food',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                  ),
                  onChanged: (value) => context
                      .read<FoodEditCubit>()
                      .editFood(food.copyWith(name: value)),
                ),
                const SizedBox(height: 20),

                // Quantity
                TextFormField(
                  initialValue: food.quantity.toString(),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Quantity',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                  ),
                  onChanged: (value) {
                    int qty = int.tryParse(value) ?? 0;
                    context
                        .read<FoodEditCubit>()
                        .editFood(food.copyWith(quantity: qty));
                  },
                ),
                const SizedBox(height: 20),

                // Description
                TextFormField(
                  initialValue: food.description,
                  keyboardType: TextInputType.multiline,
                  // minLines: 6,
                  maxLines: 6,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                  ),
                  onChanged: (value) => context
                      .read<FoodEditCubit>()
                      .editFood(food.copyWith(description: value)),
                ),
                const SizedBox(height: 20),

                // Prepared
                Row(
                  children: [
                    Expanded(
                      child: DropdownMenu<User>(
                        expandedInsets: const EdgeInsets.all(1.0),
                        label: const Text('Prepared by'),
                        initialSelection: food.preparedBy,
                        onSelected: (User? value) {
                          if (value != null) {
                            context
                                .read<FoodEditCubit>()
                                .editFood(food.copyWith(preparedBy: value));
                          }
                        },
                        dropdownMenuEntries: generateGuestEntry(state.members),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Checkbox(
                      value: food.isPrepared,
                      onChanged: (value) => context
                          .read<FoodEditCubit>()
                          .editFood(food.copyWith(isPrepared: value)),
                    ),
                    const Text('Prepared'),
                  ],
                ),
              ],
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Save',
          child: const Icon(Icons.save),
          onPressed: () {
            // context.read<FoodEditCubit>().updateFood();
            context.read<FoodListCubit>().updateFoodList(food);
          },
        ),
      ),
    );
  }
}
