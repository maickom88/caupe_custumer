import 'package:either_dart/either.dart';

import '../../core/enums/enums.dart';
import '../../core/errors/errors.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../datasources/datasources.dart';

class Auth implements AuthRepository {
  final AuthDatasource authDatasource;
  Auth({
    required this.authDatasource,
  });
  @override
  Future<Either<Failure, AuthResponse>> loginWithSocial(
      TypeProviderSocial params) async {
    try {
      switch (params) {
        case TypeProviderSocial.google:
          return Right(await authDatasource.loginWithGoogle());
        case TypeProviderSocial.facebook:
          return Right(await authDatasource.loginWithFacebook());
        case TypeProviderSocial.apple:
          return Right(await authDatasource.loginWithApple());
      }
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return Right(
          await authDatasource.loginWithEmailAndPassword(email, password));
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      return Right(await authDatasource.logout());
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> registerAccount(
      String email, String password) async {
    try {
      return Right(await authDatasource.registerAccount(email, password));
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, void>> sendEmailVerification(
      String email, String password) async {
    try {
      return Right(await authDatasource.sendEmailVerification(email, password));
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, void>> sendPhoneAuth(String params) async {
    try {
      return Right(await authDatasource.sendPhoneAuth(params));
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, bool>> signInWithPhone(String params) async {
    try {
      return Right(await authDatasource.signInWithPhone(params));
    } on Failure catch (error) {
      return Left(error);
    }
  }
}
