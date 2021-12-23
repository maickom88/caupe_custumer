import '../../domain/usecases/create_portifolio.dart';
import '../build_repositories/build_api_repository.dart';

CreatePortfolio buildCreatePortfolio() =>
    CreatePortfolio(apiRepository: buildApiRepository());
