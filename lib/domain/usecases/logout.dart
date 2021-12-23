import 'package:either_dart/either.dart';

import '../../core/errors/failure.dart';
import '../../core/usecases/usecases.dart';
import '../repositories/repositories.dart';

class Logout implements Usecase<NoParams, void> {
  final AuthRepository authRepository;
  Logout({
    required this.authRepository,
  });
  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await authRepository.logout();
  }
}
