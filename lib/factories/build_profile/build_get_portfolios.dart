import 'package:caupe_custumer/domain/usecases/get_portfolios.dart';
import 'package:caupe_custumer/factories/build_repositories/build_api_repository.dart';

GetPortfolios buildGetPortfolios() =>
    GetPortfolios(apiRepository: buildApiRepository());
