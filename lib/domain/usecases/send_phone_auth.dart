import 'package:either_dart/either.dart';

import '../../core/errors/failure.dart';
import '../../core/usecases/usecases.dart';
import '../repositories/repositories.dart';

class SendPhoneAuth implements Usecase<String, void> {
  final AuthRepository authRepository;
  SendPhoneAuth({
    required this.authRepository,
  });
  @override
  Future<Either<Failure, void>> call(String params) async {
    return await authRepository.sendPhoneAuth(params);
  }
}
