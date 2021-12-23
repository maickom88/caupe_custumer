import 'package:either_dart/either.dart';

import '../../core/errors/failure.dart';
import '../../core/usecases/usecases.dart';
import '../repositories/repositories.dart';
import 'save_cities.dart';

class DeleteCityAvailable implements Usecase<CitiesParams, void> {
  final ApiRepository apiRepository;

  DeleteCityAvailable({
    required this.apiRepository,
  });

  @override
  Future<Either<Failure, void>> call(CitiesParams params) async {
    return await apiRepository.deleteCityAvailable(params);
  }
}
