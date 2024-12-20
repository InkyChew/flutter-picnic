import 'package:picnic/guest/models/guest.dart';

class ToolItem {
  String name;
  User preparedBy;
  int quantity;
  String description;
  bool isPrepared;

  ToolItem({
    this.name = "",
    required this.preparedBy,
    this.quantity = 0,
    this.description = "",
    this.isPrepared = false,
  });
}
