import 'package:either_dart/either.dart';

import '../../core/enums/enums.dart';
import '../../core/errors/failure.dart';
import '../../core/usecases/usecases.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

class LoginWithSocial implements Usecase<TypeProviderSocial, AuthResponse> {
  final AuthRepository authRepository;
  LoginWithSocial({
    required this.authRepository,
  });
  @override
  Future<Either<Failure, AuthResponse>> call(TypeProviderSocial params) async {
    return await authRepository.loginWithSocial(params);
  }
}
