import '../../domain/usecases/get_user.dart';
import '../build_repositories/build_api_repository.dart';

GetOrCreateUser buildGetOrCreateUser() =>
    GetOrCreateUser(apiRepository: buildApiRepository());
