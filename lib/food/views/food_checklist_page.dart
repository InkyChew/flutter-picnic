import 'package:flutter/material.dart';
import 'package:picnic/food/models/food.dart';
import 'package:picnic/food/views/food_edit_page.dart';

class FoodChecklistPage extends StatelessWidget {
  final String userName = 'Alice';
  final List<FoodItem> foodItems = [
    FoodItem(
        name: 'Sandwich',
        preparedBy: 'Alice',
        quantity: 10,
        isPrepared: true,
        description: "bob donot eat meat oh no say cheese good taste"),
    FoodItem(name: 'Juice', preparedBy: 'Bob', quantity: 5, isPrepared: false),
    FoodItem(name: 'Chips', preparedBy: 'Alice', quantity: 3, isPrepared: true),
  ];

  FoodChecklistPage({super.key});

  void _navigateToFoodEditPage(BuildContext context, FoodItem? item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodEditPage(userName: userName, foodItem: item),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: foodItems.length,
        itemBuilder: (context, index) {
          final item = foodItems[index];
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 2,
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(item.name)],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Quantity: ${item.quantity}',
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
                  item.preparedBy,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              trailing: IconButton(
                icon: Icon(
                  item.isPrepared
                      ? Icons.check_circle
                      : Icons.radio_button_unchecked,
                  color:
                      item.isPrepared ? Colors.orange : Colors.orange.shade300,
                ),
                onPressed: () {
                  // Toggle the state or perform an action
                },
              ),
              onTap: () => _navigateToFoodEditPage(context, item),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => _navigateToFoodEditPage(context, null)),
    );
  }
}
