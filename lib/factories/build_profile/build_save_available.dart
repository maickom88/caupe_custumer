import 'package:caupe_custumer/domain/usecases/save_available.dart';
import 'package:caupe_custumer/factories/build_repositories/build_api_repository.dart';

SaveAvailable buildSaveAvailable() =>
    SaveAvailable(apiRepository: buildApiRepository());
