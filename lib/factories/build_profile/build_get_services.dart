import 'package:caupe_custumer/domain/usecases/get_services.dart';
import 'package:caupe_custumer/factories/build_repositories/build_api_repository.dart';

GetServices buildGetServices() =>
    GetServices(apiRepository: buildApiRepository());
