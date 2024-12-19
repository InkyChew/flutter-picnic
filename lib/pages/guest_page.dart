import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class GuestPage extends StatefulWidget {
  const GuestPage({super.key});

  @override
  State<GuestPage> createState() => _GuestPageState();
}

class _GuestPageState extends State<GuestPage> {
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.grey[800],
        ),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: guests.length,
          itemBuilder: (BuildContext context, int index) {
            final String guest = guests[index];
            return Column(
              children: [
                Slidable(
                  endActionPane:
                      ActionPane(motion: const ScrollMotion(), children: [
                    SlidableAction(
                      onPressed: (context) => _deleteGuest(guest),
                      foregroundColor: Colors.white,
                      backgroundColor: Theme.of(context).colorScheme.error,
                      icon: Icons.delete,
                      label: 'Delete',
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ]),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 2,
                    margin: const EdgeInsets.all(8),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.orange.shade100,
                      ),
                      title: Text(guest),
                      subtitle: const Text('Invited at 2024-12-10 10:30'),
                      // trailing: IconButton(
                      //   icon: const Icon(Icons.mail, color: Colors.orange),
                      //   onPressed: () {
                      //     // Send invitation
                      //   },
                      // ),
                    ),
                  ),
                ),
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: _addGuest, child: const Icon(Icons.add)),
    );
  }
}
