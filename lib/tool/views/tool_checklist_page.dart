import 'package:flutter/material.dart';
import 'package:picnic/guest/models/guest.dart';
import 'package:picnic/tool/models/tool.dart';
import 'package:picnic/tool/views/tool_edit_page.dart';

class ToolChecklistPage extends StatelessWidget {
  final User user = User(id: '', name: 'Alice', email: '');
  final List<ToolItem> foodItems = [
    ToolItem(
        name: 'Mat',
        preparedBy: User(id: '', name: 'Alice', email: ''),
        quantity: 10,
        isPrepared: true,
        description: "bob donot eat meat oh no say cheese good taste"),
    ToolItem(
        name: 'Music',
        preparedBy: User(id: '', name: 'Alice', email: ''),
        quantity: 5,
        isPrepared: false),
    ToolItem(
        name: 'Lights',
        preparedBy: User(id: '', name: 'Alice', email: ''),
        quantity: 3,
        isPrepared: true),
  ];

  ToolChecklistPage({super.key});

  void _navigateToFoodEditPage(BuildContext context, ToolItem? item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ToolEditPage(user: user, toolItem: item),
      ),
    );
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
                  item.preparedBy.name,
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
