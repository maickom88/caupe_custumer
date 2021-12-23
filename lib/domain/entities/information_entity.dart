import 'city_entity.dart';

class InformationEntity {
  String? guid;
  String? address;
  String? phone;
  String? description;
  final List<CityEntity>? locations;
  InformationEntity({
    this.guid,
    this.address,
    this.phone,
    this.description,
    this.locations,
  });
}
