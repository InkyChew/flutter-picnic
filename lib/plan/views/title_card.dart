import 'package:flutter/material.dart';

class TitleCard extends StatelessWidget {
  final String title;
  final Function(String)? titleChanged;

  const TitleCard({super.key, required this.title, this.titleChanged});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: ListTile(
        leading: const Icon(Icons.flag, color: Colors.orange),
        title: TextFormField(
          initialValue: title,
          decoration: const InputDecoration(
            hintText: 'Title',
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 8),
          ),
          onChanged: titleChanged,
        ),
      ),
    );
  }
}
