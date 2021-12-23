import 'package:caupe_custumer/domain/usecases/save_cities.dart';
import 'package:caupe_custumer/factories/build_repositories/build_api_repository.dart';

SaveCities buildSaveCities() => SaveCities(apiRepository: buildApiRepository());
