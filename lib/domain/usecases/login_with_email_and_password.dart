import 'package:either_dart/either.dart';

import '../../core/errors/failure.dart';
import '../../core/usecases/usecases.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

class LoginWithEmailAndPassword implements Usecase<LoginParams, AuthResponse> {
  final AuthRepository authRepository;
  LoginWithEmailAndPassword({
    required this.authRepository,
  });
  @override
  Future<Either<Failure, AuthResponse>> call(LoginParams params) async {
    return await authRepository.loginWithEmailAndPassword(
        params.email, params.password);
  }
}

class LoginParams {
  final String email;
  final String password;
  LoginParams({
    required this.email,
    required this.password,
  });
}
