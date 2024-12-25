import 'dart:convert';

import 'package:picnic/user/models/user.dart';

class Food {
  int id;
  String name;
  User preparedBy;
  int quantity;
  String description;
  bool isPrepared;

  Food({
    this.id = 0,
    this.name = '',
    required this.preparedBy,
    this.quantity = 1,
    this.description = '',
    this.isPrepared = false,
  });

  Food copyWith({
    int? id,
    String? name,
    User? preparedBy,
    int? quantity,
    String? description,
    bool? isPrepared,
  }) {
    return Food(
      id: id ?? this.id,
      name: name ?? this.name,
      preparedBy: preparedBy ?? this.preparedBy,
      quantity: quantity ?? this.quantity,
      description: description ?? this.description,
      isPrepared: isPrepared ?? this.isPrepared,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'preparedBy': preparedBy.toMap(),
      'quantity': quantity,
      'description': description,
      'isPrepared': isPrepared,
    };
  }

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      preparedBy: User.fromMap(map['preparedBy']),
      quantity: map['quantity']?.toInt() ?? 0,
      description: map['description'] ?? '',
      isPrepared: map['isPrepared'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Food.fromJson(String source) => Food.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Food(id: $id, name: $name, preparedBy: $preparedBy, quantity: $quantity, description: $description, isPrepared: $isPrepared)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Food &&
        other.id == id &&
        other.name == name &&
        other.preparedBy == preparedBy &&
        other.quantity == quantity &&
        other.description == description &&
        other.isPrepared == isPrepared;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        preparedBy.hashCode ^
        quantity.hashCode ^
        description.hashCode ^
        isPrepared.hashCode;
  }
}
