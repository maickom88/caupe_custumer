import 'dart:convert';

import 'package:caupe_custumer/data/models/city_model.dart';
import 'package:caupe_custumer/domain/entities/information_entity.dart';

class InformationModel implements InformationEntity {
  String? guid;
  String? address;
  String? phone;
  String? description;
  final List<CityModel>? locations;

  InformationModel({
    this.guid,
    this.address,
    this.phone,
    this.description,
    this.locations,
  });

  Map<String, dynamic> toMap() {
    return {
      'guid': guid,
      'address': address,
      'phone': phone,
      'description': description,
      'locations': locations,
    };
  }

  factory InformationModel.fromMap(Map<String, dynamic> map) {
    return InformationModel(
      guid: map['guid'],
      address: map['address'],
      phone: map['phone'],
      description: map['description'],
      locations:
          (map['locations'] as List).map((e) => CityModel.fromMap(e)).toList(),
    );
  }
  factory InformationModel.fromModel(InformationEntity? informationEntity) {
    return InformationModel(
      guid: informationEntity?.guid,
      address: informationEntity?.address,
      phone: informationEntity?.phone,
      description: informationEntity?.description,
      locations: informationEntity?.locations
          ?.map((e) => CityModel.fromModel(e))
          .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory InformationModel.fromJson(String source) =>
      InformationModel.fromMap(json.decode(source));
}
