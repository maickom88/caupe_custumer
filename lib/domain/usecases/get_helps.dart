import 'package:either_dart/either.dart';

import '../../core/errors/failure.dart';
import '../../core/usecases/usecases.dart';
import '../entities/helps_entity.dart';
import '../repositories/repositories.dart';

class GetHelps implements Usecase<String, List<HelpsEntity>> {
  final ApiRepository apiRepository;
  GetHelps({
    required this.apiRepository,
  });
  @override
  Future<Either<Failure, List<HelpsEntity>>> call(String params) async {
    return await apiRepository.getHelps(params);
  }
}
