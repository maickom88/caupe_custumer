import 'package:either_dart/either.dart';

import '../../core/errors/failure.dart';
import '../../core/usecases/usecases.dart';
import '../entities/city_entity.dart';
import '../repositories/repositories.dart';

class GetAvailableCities implements Usecase<String, List<CityEntity>> {
  final ApiRepository apiRepository;
  GetAvailableCities({
    required this.apiRepository,
  });
  @override
  Future<Either<Failure, List<CityEntity>>> call(String params) async {
    return await apiRepository.getAvailableCities(params);
  }
}
