import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

import '../../core/enums/roles.dart';
import '../../domain/entities/entities.dart';

class AuthResponseModel implements AuthResponse {
  final String? id;
  final String? name;
  final String? email;
  final bool? isEmailVerified;
  String? photoUrl;
  final String? token;
  final String? refreshToken;

  AuthResponseModel({
    this.id,
    this.name,
    this.email,
    this.isEmailVerified,
    this.photoUrl,
    this.token,
    this.refreshToken,
  });

  Map<String, dynamic> toMap({bool? firstAccess}) => {
        "email": email,
        "name": name,
        "first_access": firstAccess,
        "photo": photoUrl,
        "role": Roles.FREE.toRole()
      };

  factory AuthResponseModel.fromMap(Map<String, dynamic> map) {
    return AuthResponseModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      isEmailVerified: map['isEmailVerified'],
      photoUrl: map['photo'],
      token: map['token'],
      refreshToken: map['refreshToken'],
    );
  }

  Future<AuthResponseModel> fromCredential(UserCredential credential) async {
    final token = await credential.user?.getIdToken();
    final refreshToken = credential.user?.refreshToken;
    return AuthResponseModel(
      name: credential.user?.displayName,
      email: credential.user?.email,
      isEmailVerified: credential.user?.emailVerified,
      photoUrl: credential.user?.photoURL,
      token: token,
      refreshToken: refreshToken,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthResponseModel.fromJson(String source) =>
      AuthResponseModel.fromMap(json.decode(source));
}
