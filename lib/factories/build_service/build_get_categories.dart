import 'package:caupe_custumer/domain/usecases/get_categories.dart';
import 'package:caupe_custumer/factories/build_repositories/build_api_repository.dart';

GetCategories buildGetCategories() =>
    GetCategories(apiRepository: buildApiRepository());
