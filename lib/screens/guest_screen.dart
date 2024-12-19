import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class GuestScreen extends StatefulWidget {
  const GuestScreen({super.key});

  @override
  State<GuestScreen> createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
  List<String> guests = ['Alice', 'Bob'];

  void _addGuest() {
    setState(() {
      guests.add('Guest ${guests.length + 1}');
    });
  }

  void _deleteGuest(String value) {
    setState(() {
      guests.remove(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: guests.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Slidable(
                  endActionPane:
                      ActionPane(motion: const ScrollMotion(), children: [
                    SlidableAction(
                      onPressed: (context) => _deleteGuest(guests[index]),
                      foregroundColor: Colors.white,
                      backgroundColor: Theme.of(context).colorScheme.error,
                      icon: Icons.delete,
                      label: 'Delete',
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ]),
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.orange.shade100,
                      ),
                      title: Text(guests[index]),
                      subtitle: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Invited at 2024-12-10 10:30'),
                          Text('Invited by Inky'),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: _addGuest, child: const Icon(Icons.add)),
    );
  }
}
