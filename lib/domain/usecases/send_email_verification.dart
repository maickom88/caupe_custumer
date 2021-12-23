import 'usecases.dart';
import 'package:either_dart/either.dart';

import '../../core/errors/failure.dart';
import '../../core/usecases/usecases.dart';
import '../repositories/repositories.dart';

class SendEmailVerification implements Usecase<LoginParams, void> {
  final AuthRepository authRepository;
  SendEmailVerification({
    required this.authRepository,
  });
  @override
  Future<Either<Failure, void>> call(LoginParams params) async {
    return await authRepository.sendEmailVerification(
        params.email, params.password);
  }
}
