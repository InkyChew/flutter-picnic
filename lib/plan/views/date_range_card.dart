import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateRangeCard extends StatelessWidget {
  final DateTimeRange range;
  final Function(DateTime start, DateTime end) onChange;

  const DateRangeCard({super.key, required this.range, required this.onChange});

  Future<DateTime?> _pickDateTime({
    required BuildContext context,
    DateTime? initial,
    DateTime? min,
    DateTime? max,
  }) async {
    DateTime initialDate = initial ?? DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: min ?? DateTime(2000),
      lastDate: max ?? DateTime(2100),
    );
    if (pickedDate != null && context.mounted) {
      final time = await showTimePicker(
          context: context,
          initialTime:
              TimeOfDay(hour: initialDate.hour, minute: initialDate.minute));
      if (time != null) {
        return DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          time.hour,
          time.minute,
        );
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
              DateFormat('yyyy-MM-dd HH:mm').format(range.start),
            ),
            onTap: () async {
              var start =
                  await _pickDateTime(context: context, initial: range.start);
              if (start != null) {
                onChange(start, range.end);
              }
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.calendar_today, color: Colors.orange),
            title: Text(
              DateFormat('yyyy-MM-dd HH:mm').format(range.end),
            ),
            onTap: () async {
              var end =
                  await _pickDateTime(context: context, initial: range.end);
              if (end != null) {
                onChange(range.start, end);
              }
            },
          ),
        ],
      ),
    );
  }
}
