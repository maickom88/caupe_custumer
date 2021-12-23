import 'package:either_dart/either.dart';

import '../../core/errors/failure.dart';
import '../../core/usecases/usecases.dart';
import '../entities/available_entity.dart';
import '../repositories/repositories.dart';

class GetAvailables implements Usecase<String, List<AvailableEntity>> {
  final ApiRepository apiRepository;
  GetAvailables({
    required this.apiRepository,
  });
  @override
  Future<Either<Failure, List<AvailableEntity>>> call(String params) async {
    return await apiRepository.getAvailables(params);
  }
}
