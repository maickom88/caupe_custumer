import 'package:either_dart/either.dart';

import '../../core/errors/failure.dart';
import '../../core/usecases/usecases.dart';
import '../entities/available_entity.dart';
import '../repositories/repositories.dart';

class SaveAvailable implements Usecase<AvailableParams, AvailableEntity> {
  final ApiRepository apiRepository;
  SaveAvailable({
    required this.apiRepository,
  });
  @override
  Future<Either<Failure, AvailableEntity>> call(AvailableParams params) async {
    return await apiRepository.saveAvailable(params);
  }
}

class AvailableParams {
  final AvailableEntity available;
  final String guidUser;
  AvailableParams({
    required this.available,
    required this.guidUser,
  });
}
