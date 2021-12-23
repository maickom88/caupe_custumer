import 'package:caupe_custumer/domain/usecases/get_availables.dart';
import 'package:caupe_custumer/factories/build_repositories/build_api_repository.dart';

GetAvailables buildGetAvailables() =>
    GetAvailables(apiRepository: buildApiRepository());
