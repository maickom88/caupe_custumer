import 'dart:convert';

import '../../domain/entities/city_entity.dart';

class CityModel implements CityEntity {
  final String guid;
  final String address;
  final String code;
  final String city;
  CityModel({
    required this.guid,
    required this.address,
    required this.code,
    required this.city,
  });

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
      guid: map['guid'],
      code: map['code'],
      city: map['city'],
      address: map['address'],
    );
  }

  factory CityModel.fromModel(CityEntity city) {
    return CityModel(
      guid: city.guid,
      code: city.code,
      city: city.city,
      address: city.address,
    );
  }

  factory CityModel.fromJson(String source) =>
      CityModel.fromMap(json.decode(source));
}
