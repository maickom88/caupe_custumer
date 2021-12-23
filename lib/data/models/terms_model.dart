import 'dart:convert';

import 'package:caupe_custumer/domain/entities/terms_entity.dart';

class TermsModel implements TermsEntity {
  final String? guid;
  final String term;
  TermsModel({
    required this.guid,
    required this.term,
  });

  @override
  String toString() => 'TermsModel(guid: $guid, term: $term)';

  Map<String, dynamic> toMap() {
    return {
      'guid': guid,
      'term': term,
    };
  }

  factory TermsModel.fromMap(Map<String, dynamic> map) {
    return TermsModel(
      guid: map['guid'] != null ? map['guid'] : null,
      term: map['term'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TermsModel.fromJson(String source) =>
      TermsModel.fromMap(json.decode(source));
}
