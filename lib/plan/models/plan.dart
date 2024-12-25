import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'models.dart';

class Plan extends Equatable {
  final int id;
  final String title;
  final int placeId;
  final DateTime startDate;
  final DateTime endDate;
  final List<Member> members;
  final List<Food> foods;
  final List<Tool> tools;

  Plan({
    DateTime? startDate,
    DateTime? endDate,
    this.id = 0,
    this.title = '',
    this.placeId = 0,
    this.members = const [],
    this.foods = const [],
    this.tools = const [],
  })  : startDate = startDate ?? DateTime.now(),
        endDate = endDate ?? DateTime.now();

  @override
  List<Object> get props {
    return [
      id,
      title,
      placeId,
      startDate,
      endDate,
      members,
      foods,
      tools,
    ];
  }

  int get foodTotalCount => foods.length;
  int get foodPreparedCount => foods.where((f) => f.isPrepared).length;
  double get foodPreparedProgress => foodTotalCount == 0 ? 0 : foodPreparedCount / foodTotalCount;
  int get toolTotalCount => tools.length;
  int get toolPreparedCount => tools.where((f) => f.isPrepared).length;
  double get toolPreparedProgresst => toolTotalCount == 0 ? 0 : toolPreparedCount / toolTotalCount;
  
  Plan copyWith({
    int? id,
    String? title,
    int? placeId,
    DateTime? startDate,
    DateTime? endDate,
    List<Member>? members,
    List<Food>? foods,
    List<Tool>? tools,
  }) {
    return Plan(
      id: id ?? this.id,
      title: title ?? this.title,
      placeId: placeId ?? this.placeId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      members: members ?? this.members,
      foods: foods ?? this.foods,
      tools: tools ?? this.tools,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'placeId': placeId,
      'startDate': startDate.millisecondsSinceEpoch,
      'endDate': endDate.millisecondsSinceEpoch,
      'members': members.map((x) => x.toMap()).toList(),
      'foods': foods.map((x) => x.toMap()).toList(),
      'tools': tools.map((x) => x.toMap()).toList(),
    };
  }

  factory Plan.fromMap(Map<String, dynamic> map) {
    return Plan(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      placeId: map['placeId']?.toInt() ?? 0,
      startDate: DateTime.fromMillisecondsSinceEpoch(map['startDate']),
      endDate: DateTime.fromMillisecondsSinceEpoch(map['endDate']),
      members: List<Member>.from(map['members']?.map((x) => Member.fromMap(x))),
      foods: List<Food>.from(map['foods']?.map((x) => Food.fromMap(x))),
      tools: List<Tool>.from(map['tools']?.map((x) => Tool.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Plan.fromJson(String source) => Plan.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Plan(id: $id, title: $title, placeId: $placeId, startDate: $startDate, endDate: $endDate, members: $members, foods: $foods, tools: $tools)';
  }
}
