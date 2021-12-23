import 'category_entity.dart';
import 'sub_category_type_entity.dart';

class ServiceEntity {
  final String? guid;
  final CategoryEntity typeService;
  List<PriceEntity> value;
  ServiceEntity({
    this.guid,
    required this.typeService,
    required this.value,
  });
}

class PriceEntity {
  final String? guid;
  final double price;
  final DateTime hours;
  final SubCategoryTypeEntity? subCategory;
  PriceEntity({
    required this.guid,
    required this.price,
    required this.hours,
    this.subCategory,
  });
}
