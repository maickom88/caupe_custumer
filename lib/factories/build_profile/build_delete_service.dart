import '../../domain/usecases/delete_service.dart';
import '../build_repositories/build_api_repository.dart';

DeleteService buildDeleteService() =>
    DeleteService(apiRepository: buildApiRepository());
