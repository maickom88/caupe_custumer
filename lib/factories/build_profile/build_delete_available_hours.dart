import 'package:caupe_custumer/domain/usecases/delete_available.dart';
import 'package:caupe_custumer/factories/build_repositories/build_api_repository.dart';

DeleteAvailable buildDeleteAvailable() =>
    DeleteAvailable(apiRepository: buildApiRepository());
