import 'package:caupe_custumer/domain/usecases/get_cities.dart';
import 'package:caupe_custumer/factories/build_repositories/build_api_repository.dart';

GetCities buildGetCities() => GetCities(apiRepository: buildApiRepository());
