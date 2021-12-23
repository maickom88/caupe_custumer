import 'package:either_dart/either.dart';

import '../../core/enums/enums.dart';
import '../../core/errors/errors.dart';
import '../entities/entities.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResponse>> loginWithSocial(
      TypeProviderSocial params);
  Future<Either<Failure, AuthResponse>> loginWithEmailAndPassword(
      String email, String password);
  Future<Either<Failure, AuthResponse>> registerAccount(
      String email, String password);
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, void>> sendPhoneAuth(String params);
  Future<Either<Failure, bool>> signInWithPhone(String params);
  Future<Either<Failure, void>> sendEmailVerification(
      String email, String password);
}
