import 'package:caupe_custumer/domain/usecases/update_serivce.dart';
import 'package:caupe_custumer/factories/build_repositories/build_api_repository.dart';

UpdateService buildUpdateService() =>
    UpdateService(apiRepository: buildApiRepository());
