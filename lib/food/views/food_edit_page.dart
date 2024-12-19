import 'package:flutter/material.dart';
import 'package:picnic/food/models/food.dart';

class FoodEditPage extends StatefulWidget {
  final String userName;
  final FoodItem? foodItem;

  const FoodEditPage(
      {super.key, required this.userName, required this.foodItem});

  @override
  State<FoodEditPage> createState() => _PersonalFoodChecklistPageState();
}

class _PersonalFoodChecklistPageState extends State<FoodEditPage> {
  late FoodItem food;

  @override
  void initState() {
    super.initState();
    food = widget.foodItem ?? FoodItem(preparedBy: widget.userName);
  }

  void _updateFoodItem(int quantity, bool isPrepared) {
    setState(() {
      food.quantity = quantity;
      food.isPrepared = isPrepared;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 2,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  initialValue: food.name,
                  decoration: const InputDecoration(
                    labelText: 'Food',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                  ),
                  onChanged: (value) {},
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
                    final newQuantity = int.tryParse(value) ?? 0;
                    _updateFoodItem(newQuantity, food.isPrepared);
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
                  onChanged: (value) {},
                ),
                const SizedBox(height: 20),

                Row(
                  children: [
                    Checkbox(
                      value: food.isPrepared,
                      onChanged: (value) {
                        _updateFoodItem(food.quantity, value ?? false);
                      },
                    ),
                    const Text('Prepared'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
