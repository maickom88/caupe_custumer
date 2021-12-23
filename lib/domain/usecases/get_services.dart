import 'package:either_dart/either.dart';

import '../../core/errors/failure.dart';
import '../../core/usecases/usecases.dart';
import '../entities/service_entity.dart';
import '../repositories/repositories.dart';

class GetServices implements Usecase<String, List<ServiceEntity>> {
  final ApiRepository apiRepository;
  GetServices({
    required this.apiRepository,
  });
  @override
  Future<Either<Failure, List<ServiceEntity>>> call(String params) async {
    return await apiRepository.getServices(params);
  }
}
