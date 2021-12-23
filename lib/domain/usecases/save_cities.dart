import 'package:either_dart/either.dart';

import '../../core/errors/failure.dart';
import '../../core/usecases/usecases.dart';
import '../entities/city_entity.dart';
import '../repositories/repositories.dart';

class SaveCities implements Usecase<CitiesParams, CityEntity> {
  final ApiRepository apiRepository;
  SaveCities({
    required this.apiRepository,
  });
  @override
  Future<Either<Failure, CityEntity>> call(CitiesParams params) async {
    return await apiRepository.saveCities(params);
  }
}

class CitiesParams {
  final String guidLocation;
  final String guidInformation;
  CitiesParams({
    required this.guidLocation,
    required this.guidInformation,
  });
}
