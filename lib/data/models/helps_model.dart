import 'dart:convert';

import 'package:caupe_custumer/domain/entities/helps_entity.dart';

import 'evaluetion_help_model.dart';

class HelpsModel implements HelpsEntity {
  final String guid;
  final String title;
  final String description;
  EvaluetionHelpModel? evaluation;

  HelpsModel({
    required this.guid,
    required this.title,
    required this.description,
    this.evaluation,
  });

  Map<String, dynamic> toMap() {
    return {
      'guid': guid,
      'title': title,
      'description': description,
      'evaluation': evaluation?.toMap(),
    };
  }

  factory HelpsModel.fromMap(Map<String, dynamic> map) {
    return HelpsModel(
      guid: map['guid'],
      title: map['title'],
      description: map['description'],
      evaluation: map['evaluation'] != null
          ? EvaluetionHelpModel.fromMap(map['evaluation'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HelpsModel.fromJson(String source) =>
      HelpsModel.fromMap(json.decode(source));
}
