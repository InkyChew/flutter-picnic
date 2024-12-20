import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:picnic/food/views/food_checklist_page.dart';
import 'package:picnic/pages/guest_page.dart';

class PlanPage extends StatefulWidget {
  const PlanPage({super.key});

  @override
  State<PlanPage> createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  DateTime? startDate;
  DateTime? endDate;

  List<String> guests = [];
  int foodPreparedCount = 2;
  int totalFoodItems = 5; // Example count

  void _pickDateTime(
      BuildContext context, Function(DateTime) onDateSelected) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && context.mounted) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (time != null) {
        onDateSelected(DateTime(pickedDate.year, pickedDate.month,
            pickedDate.day, time.hour, time.minute));
      }
    }
  }

  void _navigateToGuestScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const GuestPage(),
        ));
  }

  void _navigateToFoodChecklist() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => FoodChecklistPage(
              //   onFoodProgressChanged: (preparedCount) {
              //     setState(() {
              //       foodPreparedCount = preparedCount;
              //     });
              //   },
              )),
    );
  }

  void _navigateToToolChecklist() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FoodChecklistPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    double progress =
        totalFoodItems == 0 ? 0 : foodPreparedCount / totalFoodItems;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Let's plan a picnic!", style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
                child: ListTile(
                  leading: const Icon(Icons.flag, color: Colors.orange),
                  title: TextFormField(
                    initialValue: 'Time With Wild',
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    ),
                    onChanged: (value) {},
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Start and End Datetime
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.calendar_today,
                        color: Colors.orange,
                      ),
                      title: Text(
                        startDate == null
                            ? 'Start Date'
                            : DateFormat('yyyy-MM-dd HH:mm').format(startDate!),
                      ),
                      onTap: () => _pickDateTime(
                        context,
                        (date) => setState(() => startDate = date),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.calendar_today,
                          color: Colors.orange),
                      title: Text(
                        endDate == null
                            ? 'End Date'
                            : DateFormat('yyyy-MM-dd HH:mm').format(endDate!),
                      ),
                      onTap: () => _pickDateTime(
                        context,
                        (date) => setState(() => endDate = date),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Place
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
                child: ListTile(
                  leading: const Icon(Icons.map, color: Colors.orange),
                  title: const Text('Place'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Add map selection logic here.
                  },
                ),
              ),
              const SizedBox(height: 20),

              // Guests
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
                child: ListTile(
                  title: const Row(children: [
                    Icon(Icons.face, color: Colors.orange),
                    SizedBox(width: 10),
                    Text('Guests (10)'),
                  ]),
                  subtitle: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: guests
                          .map((guest) => Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, right: 8.0),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 28,
                                      backgroundColor: Colors.orange.shade100,
                                      child: Text(
                                        guest[0],
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      guest,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: _navigateToGuestScreen,
                ),
              ),
              const SizedBox(height: 20),

              // Food
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
                child: ListTile(
                  leading: const Icon(Icons.fastfood, color: Colors.orange),
                  title: const Text('Food'),
                  subtitle: Stack(
                    alignment: Alignment.center,
                    children: [
                      LinearProgressIndicator(
                        value: progress,
                        minHeight: 16,
                        borderRadius: BorderRadius.circular(12),
                        backgroundColor: Colors.orange.shade100,
                        color: Colors.orange,
                      ),
                      Text(
                        '$foodPreparedCount / $totalFoodItems',
                        // style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: _navigateToFoodChecklist,
                ),
              ),
              const SizedBox(height: 20),

              // Tool
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
                child: ListTile(
                  leading:
                      const Icon(Icons.shopping_basket, color: Colors.orange),
                  title: const Text('Tool'),
                  subtitle: Stack(
                    alignment: Alignment.center,
                    children: [
                      LinearProgressIndicator(
                        value: progress,
                        minHeight: 16,
                        borderRadius: BorderRadius.circular(12),
                        backgroundColor: Colors.orange.shade100,
                        color: Colors.orange,
                      ),
                      Text(
                        '$foodPreparedCount / $totalFoodItems',
                        // style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: _navigateToToolChecklist,
                ),
              ),
              const SizedBox(height: 20),

              // Activity
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
                child: ListTile(
                  leading: const Icon(Icons.eco_outlined, color: Colors.orange),
                  title: const Text('Activity'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Add activity logic here.
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
