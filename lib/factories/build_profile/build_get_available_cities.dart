import 'package:caupe_custumer/domain/usecases/get_available_cities.dart';
import 'package:caupe_custumer/factories/build_repositories/build_api_repository.dart';

GetAvailableCities buildGetAvailableCities() =>
    GetAvailableCities(apiRepository: buildApiRepository());
