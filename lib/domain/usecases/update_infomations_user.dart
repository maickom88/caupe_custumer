import 'package:either_dart/either.dart';

import '../../core/errors/failure.dart';
import '../../core/usecases/usecases.dart';
import '../entities/entities.dart';
import '../entities/information_entity.dart';
import '../repositories/repositories.dart';

class UpdateInformationUser implements Usecase<UserEntity, InformationEntity> {
  final ApiRepository apiRepository;
  UpdateInformationUser({
    required this.apiRepository,
  });
  @override
  Future<Either<Failure, InformationEntity>> call(UserEntity params) async {
    return await apiRepository.updateInformationUser(params);
  }
}
