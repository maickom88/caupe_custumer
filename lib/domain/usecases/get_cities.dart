import 'package:either_dart/either.dart';

import '../../core/errors/failure.dart';
import '../../core/usecases/usecases.dart';
import '../entities/city_entity.dart';
import '../repositories/repositories.dart';

class GetCities implements Usecase<NoParams, List<CityEntity>> {
  final ApiRepository apiRepository;
  GetCities({
    required this.apiRepository,
  });
  @override
  Future<Either<Failure, List<CityEntity>>> call(NoParams params) async {
    return await apiRepository.getCities();
  }
}
