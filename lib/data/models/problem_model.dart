import 'dart:convert';

import 'package:caupe_custumer/domain/entities/problem_entity.dart';

class ProblemModel implements ProblemEntity {
  final String guid;
  final String title;
  final String description;
  ProblemModel({
    required this.title,
    required this.description,
    required this.guid,
  });

  Map<String, dynamic> toMap() {
    return {
      'guid': guid,
      'title': title,
      'description': description,
    };
  }

  factory ProblemModel.fromMap(Map<String, dynamic> map) {
    return ProblemModel(
      guid: map['guid'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProblemModel.fromJson(String source) =>
      ProblemModel.fromMap(json.decode(source));
}
