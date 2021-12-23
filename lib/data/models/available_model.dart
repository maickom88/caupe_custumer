import 'dart:convert';

import '../../core/enums/type_days.dart';
import '../../domain/entities/available_entity.dart';

class AvailableModel implements AvailableEntity {
  final String? guid;
  final List<TypeDay> days;
  final firstTime;
  final lastTime;

  AvailableModel({
    this.guid,
    required this.days,
    required this.firstTime,
    required this.lastTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'guid': guid,
      'days': days.map((x) => x.dayInString()).toList(),
      'first_time': firstTime,
      'last_time': lastTime,
    };
  }

  factory AvailableModel.fromMap(Map<String, dynamic> map) {
    return AvailableModel(
      days: (map['days'] as List)
          .map<TypeDay>((e) => (e as String).toTypeDayInString())
          .toList(),
      guid: map['guid'],
      firstTime: map['first_time'],
      lastTime: map['last_time'],
    );
  }

  factory AvailableModel.fromModel(AvailableEntity available) {
    return AvailableModel(
      guid: available.guid,
      days: available.days,
      firstTime: available.firstTime,
      lastTime: available.lastTime,
    );
  }

  String toJson() => json.encode(toMap());

  factory AvailableModel.fromJson(String source) =>
      AvailableModel.fromMap(json.decode(source));
}
