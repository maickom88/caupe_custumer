import 'package:caupe_custumer/domain/usecases/delete_city_available.dart';
import 'package:caupe_custumer/factories/build_repositories/build_api_repository.dart';

DeleteCityAvailable deleteCityAvailable() =>
    DeleteCityAvailable(apiRepository: buildApiRepository());
