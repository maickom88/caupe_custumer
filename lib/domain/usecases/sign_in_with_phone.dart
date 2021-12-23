import 'package:either_dart/either.dart';

import '../../core/errors/failure.dart';
import '../../core/usecases/usecases.dart';
import '../repositories/repositories.dart';

class SignInWithPhone implements Usecase<String, void> {
  final AuthRepository authRepository;
  SignInWithPhone({
    required this.authRepository,
  });
  @override
  Future<Either<Failure, bool>> call(String params) async {
    return await authRepository.signInWithPhone(params);
  }
}
