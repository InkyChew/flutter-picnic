import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:picnic/plan/bloc/plan_bloc.dart';
import 'package:picnic/plan/models/models.dart';
import 'package:picnic/plan/views/food_checklist_page.dart';
import 'package:picnic/plan/views/guest_page.dart';
import 'package:picnic/place/views/place_search.dart';
import 'package:picnic/plan/views/tool_checklist_page.dart';

class PlanPage extends StatefulWidget {
  const PlanPage({super.key});

  @override
  State<PlanPage> createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {

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

  void _navigateToSearchPlace() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PlaceSearch(),
        ));
  }

  void _navigateToGuestScreen(Plan plan) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GuestPage(members: plan.members),
        ));
  }

  void _navigateToFoodChecklist(Plan plan) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => FoodChecklistPage(foods: plan.foods)),
    );
  }

  void _navigateToToolChecklist(Plan plan) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ToolChecklistPage(tools: plan.tools)),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlanBloc, PlanState>(
      builder: (context, state) {
        if (state is PlanInitial) {
          return const Text('Initial');
        }
        if (state is PlanLoading) {
          return const Text('LOADING');
        }
        if (state is PlanLoaded) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text(
                "Let's plan a picnic!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            body: ListView(padding: const EdgeInsets.all(16.0), children: [
              // Title
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
                child: ListTile(
                  leading: const Icon(Icons.flag, color: Colors.orange),
                  title: TextFormField(
                    initialValue: state.plan.title,
                    decoration: const InputDecoration(
                      hintText: 'Title',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    ),
                    onChanged: (value) {},
                  ),
                ),
              ),
              const SizedBox(height: 16),

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
                        DateFormat('yyyy-MM-dd HH:mm').format(state.plan.startDate),
                      ),
                      onTap: () => _pickDateTime(
                        context,
                        (date) =>
                            setState(() => state.plan.copyWith(startDate: date)),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.calendar_today,
                          color: Colors.orange),
                      title: Text(
                        DateFormat('yyyy-MM-dd HH:mm').format(state.plan.endDate),
                      ),
                      onTap: () => _pickDateTime(
                        context,
                        (date) => setState(() => state.plan.copyWith(endDate: date)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

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
                  onTap: _navigateToSearchPlace,
                ),
              ),
              const SizedBox(height: 16),

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
                      children: state.plan.members
                          .map((member) => Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, right: 8.0),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 28,
                                      backgroundColor: Colors.orange.shade100,
                                      child: Text(
                                        member.user.name,
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      member.user.name,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () => _navigateToGuestScreen(state.plan),
                ),
              ),
              const SizedBox(height: 16),

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
                        value: state.plan.foodPreparedProgress,
                        minHeight: 16,
                        borderRadius: BorderRadius.circular(12),
                        backgroundColor: Colors.orange.shade100,
                        color: Colors.orange,
                      ),
                      Text(
                        '${state.plan.foodPreparedCount} / ${state.plan.foodTotalCount}',
                        // style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () => _navigateToFoodChecklist(state.plan),
                ),
              ),
              const SizedBox(height: 16),

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
                        value: state.plan.toolPreparedProgresst,
                        minHeight: 16,
                        borderRadius: BorderRadius.circular(12),
                        backgroundColor: Colors.orange.shade100,
                        color: Colors.orange,
                      ),
                      Text(
                        '${state.plan.toolPreparedCount} / ${state.plan.toolTotalCount}',
                        // style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () => _navigateToToolChecklist(state.plan),
                ),
              ),
              const SizedBox(height: 16),

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
            ]),
          );
        }
        return const Placeholder();
      },
    );
  }
}
