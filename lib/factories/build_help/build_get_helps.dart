import '../../domain/usecases/get_helps.dart';
import '../build_repositories/build_api_repository.dart';

GetHelps buildgetHelps() => GetHelps(apiRepository: buildApiRepository());
