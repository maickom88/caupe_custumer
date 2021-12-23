import 'dart:convert';

import 'package:caupe_custumer/domain/entities/evaluetion_help_entity.dart';

class EvaluetionHelpModel implements EvaluetionHelpEntity {
  final String guid;
  final String email;
  bool? isGood;

  EvaluetionHelpModel({
    required this.guid,
    this.isGood,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'guid': guid,
      'email': email,
      'is_good': isGood,
    };
  }

  factory EvaluetionHelpModel.fromMap(Map<String, dynamic> map) {
    return EvaluetionHelpModel(
      guid: map['guid'],
      email: map['email'],
      isGood: map['is_good'] != null
          ? map['is_good'] == 'LIKED'
              ? true
              : false
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EvaluetionHelpModel.fromJson(String source) =>
      EvaluetionHelpModel.fromMap(json.decode(source));
}
