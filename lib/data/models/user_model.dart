import 'dart:convert';

import 'package:caupe_custumer/domain/entities/entities.dart';

import 'information_model.dart';

class UserModel implements UserEntity {
  String name;
  String guid;
  String? photo;
  final String email;
  final String? document;
  final InformationModel? information;
  UserModel({
    required this.guid,
    required this.name,
    this.photo,
    required this.email,
    this.document,
    this.information,
  });

  Map<String, dynamic> toMap() {
    return {
      'guid': guid,
      'name': name,
      'photo': photo,
      'email': email,
      'document': document,
    };
  }

  Map<String, dynamic> toData() {
    return {
      'guid': information?.guid,
      'guid_user': guid,
      'phone': information?.phone,
      'description': information?.description,
      'address': information?.address,
      'photo': photo,
      'name': name,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      guid: map['guid'],
      name: map['name'],
      photo: map['photo'],
      email: map['email'],
      document: map['document'],
      information: map['information'] != null
          ? InformationModel.fromMap(map['information'])
          : null,
    );
  }
  factory UserModel.fromModel(UserEntity userEntity) {
    return UserModel(
      guid: userEntity.guid,
      name: userEntity.name,
      photo: userEntity.photo,
      email: userEntity.email,
      document: userEntity.document,
      information: InformationModel.fromModel(userEntity.information),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
