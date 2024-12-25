import 'package:flutter/material.dart';
import 'package:picnic/plan/models/food.dart';
import 'package:picnic/user/models/user.dart';

class FoodEditPage extends StatefulWidget {
  final User user;
  final Food? foodItem;

  const FoodEditPage({super.key, required this.user, required this.foodItem});

  @override
  State<FoodEditPage> createState() => _PersonalFoodChecklistPageState();
}

class _PersonalFoodChecklistPageState extends State<FoodEditPage> {
  late Food food;
  List<User> members = [
    User(name: 'Alice', email: ''),
    User(name: 'Bob', email: ''),
    User(name: 'Inky', email: '')
  ];

  static List<DropdownMenuEntry<User>> generateGuestEntry(List<User> members) {
    return members.map<DropdownMenuEntry<User>>((User guest) {
      return DropdownMenuEntry<User>(
        value: guest,
        label: guest.name,
      );
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    food = widget.foodItem ?? Food(preparedBy: widget.user);
  }

  void _updateFoodItem(int quantity, bool isPrepared) {
    setState(() {
      food.quantity = quantity;
      food.isPrepared = isPrepared;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.grey[800],
        ),
      ),
      body: ListView(
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

                  // Prepared
                  Row(
                    children: [
                      Expanded(
                        child: DropdownMenu<User>(
                          expandedInsets: const EdgeInsets.all(1.0),
                          hintText: 'Prepared by',
                          initialSelection: food.preparedBy,
                          onSelected: (User? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              food.preparedBy = value!;
                            });
                          },
                          dropdownMenuEntries: generateGuestEntry(members),
                        ),
                      ),
                      const SizedBox(width: 10),
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
      ),
    );
  }
}
