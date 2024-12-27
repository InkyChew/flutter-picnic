import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:picnic/plan/cubit/guest_cubit.dart';
import 'package:picnic/plan/models/models.dart';

class GuestPage extends StatelessWidget {
  final List<Member> members;
  const GuestPage({
    super.key,
    required this.members,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GuestCubit(members),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.grey[800],
          ),
        ),
        body: BlocConsumer<GuestCubit, GuestState>(
          listener: (context, state) {
            if (state.status == Status.loading) {
              showDialog(
                context: context,
                barrierDismissible:
                    false, // Prevent dismissing by tapping outside
                builder: (BuildContext context) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
            } else {
              // Close the loading dialog if it's open
              Navigator.of(context, rootNavigator: true).pop();
            }
          },
          builder: (context, state) {
            return BlocBuilder<GuestCubit, GuestState>(
              builder: (context, state) {
                return ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: state.members.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Member member = state.members[index];
                      return Column(
                        children: [
                          Slidable(
                            endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) => context
                                        .read<GuestCubit>()
                                        .deleteMember(member),
                                    foregroundColor: Colors.white,
                                    backgroundColor:
                                        Theme.of(context).colorScheme.error,
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
                                subtitle:
                                    const Text('Invited at 2024-12-10 10:30'),
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
                    });
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => {}, child: const Icon(Icons.add)),
      ),
    );
  }
}
