import 'dart:convert';

import 'package:caupe_custumer/data/models/category_model.dart';
import 'package:caupe_custumer/data/models/sub_category_type_model.dart';

import '../../domain/entities/service_entity.dart';

class ServiceModel implements ServiceEntity {
  final String? guid;
  final CategoryModel typeService;
  List<PriceEntity> value;
  ServiceModel({
    this.guid,
    required this.typeService,
    required this.value,
  });

  // Map<String, dynamic> toMap() {
  //   return {
  //     'name': name,
  //     'photo': photo,
  //     'guid': guid,
  //     'values': values.map((x) => x.toMap()).toList(),
  //   };
  // }

  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      guid: map['guid'],
      typeService: CategoryModel.fromMap(map['type_service']),
      value: List<PriceModel>.from(
          map['value']?.map((x) => PriceModel.fromMap(x))),
    );
  }

  factory ServiceModel.fromModel(ServiceEntity service) {
    return ServiceModel(
      guid: service.guid,
      typeService: CategoryModel.fromModel(service.typeService),
      value: service.value
          .map<PriceModel>((e) => PriceModel.fromModel(e))
          .toList(),
    );
  }

  // String toJson() => json.encode(toMap());

  factory ServiceModel.fromJson(String source) =>
      ServiceModel.fromMap(json.decode(source));
}

class PriceModel implements PriceEntity {
  final String? guid;
  final double price;
  final DateTime hours;
  final SubCategoryTypeModel? subCategory;
  PriceModel({
    this.guid,
    required this.price,
    required this.hours,
    this.subCategory,
  });

  // Map<String, dynamic> toMap() {
  //   return {
  //     'name': name,
  //     'price': price,
  //     'hours': hours,
  //   };
  // }

  factory PriceModel.fromMap(Map<String, dynamic> map) {
    return PriceModel(
        guid: map['name'],
        price: map['price'],
        hours: DateTime.parse(map['hours']),
        subCategory: SubCategoryTypeModel.fromMap(map['sub_category']));
  }

  factory PriceModel.fromModel(PriceEntity price) {
    return PriceModel(
      guid: price.guid,
      price: price.price,
      hours: price.hours,
    );
  }

  // String toJson() => json.encode(toMap());

  factory PriceModel.fromJson(String source) =>
      PriceModel.fromMap(json.decode(source));
}
