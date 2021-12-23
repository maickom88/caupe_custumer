import 'package:either_dart/either.dart';

import '../../core/errors/failure.dart';
import '../../core/usecases/usecases.dart';
import '../entities/service_entity.dart';
import '../repositories/repositories.dart';

class UpdateService implements Usecase<ServiceParams, ServiceEntity> {
  final ApiRepository apiRepository;
  UpdateService({
    required this.apiRepository,
  });
  @override
  Future<Either<Failure, ServiceEntity>> call(ServiceParams params) async {
    return await apiRepository.updateService(params);
  }
}

class ServiceParams {
  final ServiceEntity service;
  final String guidUser;
  ServiceParams({
    required this.service,
    required this.guidUser,
  });
}
