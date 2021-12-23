import 'package:caupe_custumer/domain/usecases/delete_portfolio.dart';
import 'package:caupe_custumer/factories/build_repositories/build_api_repository.dart';

DeletePortfolio buildDeletePortfolio() =>
    DeletePortfolio(apiRepository: buildApiRepository());
