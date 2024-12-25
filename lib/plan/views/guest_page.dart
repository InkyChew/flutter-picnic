import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:picnic/plan/models/models.dart';
import 'package:picnic/user/models/user.dart';

class GuestPage extends StatefulWidget {
  final List<Member> members;
  const GuestPage({
    super.key,
    required this.members,
  });

  @override
  State<GuestPage> createState() => _GuestPageState();
}

class _GuestPageState extends State<GuestPage> {
  late List<Member> members;

  @override
  void initState() {
    members = widget.members;
    super.initState();
  }

  void _addMember() {
    setState(() {
      var member = Member(user: User(name: 'Guest ${members.length + 1}', email: ''));
      members.add(member);
    });
  }

  void _deleteMember(Member value) {
    setState(() {
      members.remove(value);
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
          itemCount: members.length,
          itemBuilder: (BuildContext context, int index) {
            final Member member = members[index];
            return Column(
              children: [
                Slidable(
                  endActionPane:
                      ActionPane(motion: const ScrollMotion(), children: [
                    SlidableAction(
                      onPressed: (context) => _deleteMember(member),
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
                      title: Text(member.user.name),
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
          onPressed: _addMember, child: const Icon(Icons.add)),
    );
  }
}
