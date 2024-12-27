import 'dart:convert';

import 'package:picnic/user/models/user.dart';

class Tool {
  int id;
  String name;
  User preparedBy;
  int quantity;
  String description;
  bool isPrepared;
  int planId;

  Tool({
    this.id = 0,
    this.name = '',
    required this.preparedBy,
    this.quantity = 1,
    this.description = '',
    this.isPrepared = false,
    required this.planId,
  });

  Tool copyWith({
    int? id,
    String? name,
    User? preparedBy,
    int? quantity,
    String? description,
    bool? isPrepared,
    int? planId,
  }) {
    return Tool(
      id: id ?? this.id,
      name: name ?? this.name,
      preparedBy: preparedBy ?? this.preparedBy,
      quantity: quantity ?? this.quantity,
      description: description ?? this.description,
      isPrepared: isPrepared ?? this.isPrepared,
      planId: planId ?? this.planId,
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
      'planId': planId,
    };
  }

  factory Tool.fromMap(Map<String, dynamic> map) {
    return Tool(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      preparedBy: User.fromMap(map['preparedBy']),
      quantity: map['quantity']?.toInt() ?? 0,
      description: map['description'] ?? '',
      isPrepared: map['isPrepared'] ?? false,
      planId: map['planId']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Tool.fromJson(String source) => Tool.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Tool(id: $id, name: $name, preparedBy: $preparedBy, quantity: $quantity, description: $description, isPrepared: $isPrepared, planId: $planId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Tool &&
      other.id == id &&
      other.name == name &&
      other.preparedBy == preparedBy &&
      other.quantity == quantity &&
      other.description == description &&
      other.isPrepared == isPrepared &&
      other.planId == planId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      preparedBy.hashCode ^
      quantity.hashCode ^
      description.hashCode ^
      isPrepared.hashCode ^
      planId.hashCode;
  }
}
