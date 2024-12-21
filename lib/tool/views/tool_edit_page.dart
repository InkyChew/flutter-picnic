import 'package:flutter/material.dart';
import 'package:picnic/tool/models/tool.dart';
import 'package:picnic/guest/models/guest.dart';

class ToolEditPage extends StatefulWidget {
  final User user;
  final ToolItem? toolItem;

  const ToolEditPage({super.key, required this.user, required this.toolItem});

  @override
  State<ToolEditPage> createState() => _PersonaltoolChecklistPageState();
}

class _PersonaltoolChecklistPageState extends State<ToolEditPage> {
  late ToolItem tool;
  List<User> guests = [
    User(id: '', name: 'Alice', email: ''),
    User(id: '', name: 'Bob', email: ''),
    User(id: '', name: 'Inky', email: '')
  ];

  static List<DropdownMenuEntry<User>> generateGuestEntry(List<User> guests) {
    return guests.map<DropdownMenuEntry<User>>((User guest) {
      return DropdownMenuEntry<User>(
        value: guest,
        label: guest.name,
      );
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    tool = widget.toolItem ?? ToolItem(preparedBy: widget.user);
  }

  void _updatetoolItem(int quantity, bool isPrepared) {
    setState(() {
      tool.quantity = quantity;
      tool.isPrepared = isPrepared;
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
      body: ListView(
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 2,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    initialValue: tool.name,
                    decoration: const InputDecoration(
                      labelText: 'Tool',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    ),
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 20),

                  // Quantity
                  TextFormField(
                    initialValue: tool.quantity.toString(),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Quantity',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    ),
                    onChanged: (value) {
                      final newQuantity = int.tryParse(value) ?? 0;
                      _updatetoolItem(newQuantity, tool.isPrepared);
                    },
                  ),
                  const SizedBox(height: 20),

                  // Description
                  TextFormField(
                    initialValue: tool.description,
                    keyboardType: TextInputType.multiline,
                    // minLines: 6,
                    maxLines: 6,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                    ),
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 20),

                  // Prepared
                  Row(
                    children: [
                      Expanded(
                        child: DropdownMenu<User>(
                          expandedInsets: const EdgeInsets.all(1.0),
                          hintText: 'Prepared by',
                          initialSelection: tool.preparedBy,
                          onSelected: (User? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              tool.preparedBy = value!;
                            });
                          },
                          dropdownMenuEntries: generateGuestEntry(guests),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Checkbox(
                        value: tool.isPrepared,
                        onChanged: (value) {
                          _updatetoolItem(tool.quantity, value ?? false);
                        },
                      ),
                      const Text('Prepared'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
