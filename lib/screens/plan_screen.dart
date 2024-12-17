import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  DateTime? startDate;
  DateTime? endDate;

  List<String> guests = [];
  int foodPreparedCount = 0;
  int totalFoodItems = 5; // Example count

  void _pickDateTime(
      BuildContext context, Function(DateTime) onDateSelected) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (time != null) {
        onDateSelected(DateTime(pickedDate.year, pickedDate.month,
            pickedDate.day, time.hour, time.minute));
      }
    }
  }

  void _addGuest() {
    setState(() {
      guests.add('Guest ${guests.length + 1}');
    });
  }

  void _navigateToFoodChecklist() {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //       builder: (context) => FoodChecklistPage(
    //             onFoodProgressChanged: (preparedCount) {
    //               setState(() {
    //                 foodPreparedCount = preparedCount;
    //               });
    //             },
    //           )),
    // );
  }

  @override
  Widget build(BuildContext context) {
    double progress =
        totalFoodItems == 0 ? 0 : foodPreparedCount / totalFoodItems;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            const Text(
              'Plan Your Picnic',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
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
                      color: Colors.blue,
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
                  Divider(),
                  ListTile(
                    leading: const Icon(Icons.calendar_today, color: Colors.blue),
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
        
            // Map Selector
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
              child: ListTile(
                leading: const Icon(Icons.map, color: Colors.green),
                title: const Text('Choose Location'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Add map selection logic here.
                },
              ),
            ),
            const SizedBox(height: 20),
        
            // Guests Section
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title and Add Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Guests',
                          style: TextStyle(fontSize: 16),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_circle_outline,
                              size: 32, color: Colors.blue),
                          onPressed: _addGuest,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
        
                    // Guests List
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: guests
                            .map((guest) => Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 28,
                                        backgroundColor: Colors.blue.shade100,
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
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
        
            // Food Checklist
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
              child: ListTile(
                leading: const Icon(Icons.fastfood, color: Colors.orange),
                title: const Text('Food Checklist'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${(progress * 100).toStringAsFixed(0)}% Prepared',
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 6),
                    LinearProgressIndicator(
                      value: progress,
                      minHeight: 10,
                      backgroundColor: Colors.orange.shade100,
                      color: Colors.orange,
                    ),
                  ],
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: _navigateToFoodChecklist,
              ),
            ),
            const SizedBox(height: 20),
        
            // Food Checklist
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
              child: ListTile(
                leading: const Icon(Icons.fastfood, color: Colors.orange),
                title: const Text('Food Checklist'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${(progress * 100).toStringAsFixed(0)}% Prepared',
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 6),
                    LinearProgressIndicator(
                      value: progress,
                      minHeight: 10,
                      backgroundColor: Colors.orange.shade100,
                      color: Colors.orange,
                    ),
                  ],
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: _navigateToFoodChecklist,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
