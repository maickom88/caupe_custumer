import 'information_entity.dart';

class UserEntity {
  String name;
  String guid;
  String? photo;
  final String email;
  final String? document;
  final InformationEntity? information;
  UserEntity({
    required this.name,
    required this.guid,
    this.photo,
    required this.email,
    this.document,
    this.information,
  });
}
