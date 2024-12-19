class FoodItem {
  String name;
  String preparedBy;
  int quantity;
  String description;
  bool isPrepared;

  FoodItem({
    this.name = "",
    required this.preparedBy,
    this.quantity = 0,
    this.description = "",
    this.isPrepared = false,
  });
}
