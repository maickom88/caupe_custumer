import '../../core/enums/roles.dart';

class AuthResponse {
  final String? id;
  final String? name;
  final String? email;
  final bool? isEmailVerified;
  final String? photoUrl;
  final String? token;
  final String? refreshToken;

  AuthResponse({
    this.id,
    this.name,
    this.email,
    this.isEmailVerified,
    this.photoUrl,
    this.token,
    this.refreshToken,
  });

  Map<String, dynamic> toMap({required bool firstAccess}) => {
        "email": email,
        "name": name,
        "first_access": firstAccess,
        "photo": photoUrl,
        "role": Roles.FREE.toRole()
      };
}
