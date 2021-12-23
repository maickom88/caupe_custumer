import 'package:either_dart/either.dart';

import '../../core/errors/failure.dart';
import '../../core/usecases/usecases.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

class GetOrCreateUser implements Usecase<AuthResponse, UserEntity> {
  final ApiRepository apiRepository;
  GetOrCreateUser({
    required this.apiRepository,
  });
  @override
  Future<Either<Failure, UserEntity>> call(AuthResponse params) async {
    return await apiRepository.getOrCreateUser(params);
  }
}
