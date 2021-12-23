import 'dart:convert';

import '../../domain/entities/sub_category_type_entity.dart';

class SubCategoryTypeModel implements SubCategoryTypeEntity {
  final String guid;
  final String title;

  SubCategoryTypeModel({
    required this.guid,
    required this.title,
  });

  Map<String, dynamic> toMap() {
    return {
      'guid': guid,
      'title': title,
    };
  }

  factory SubCategoryTypeModel.fromMap(Map<String, dynamic> map) {
    return SubCategoryTypeModel(
      guid: map['guid'],
      title: map['title'],
    );
  }
  factory SubCategoryTypeModel.fromModel(SubCategoryTypeEntity entity) {
    return SubCategoryTypeModel(
      guid: entity.guid,
      title: entity.title,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubCategoryTypeModel.fromJson(String source) =>
      SubCategoryTypeModel.fromMap(json.decode(source));
}
