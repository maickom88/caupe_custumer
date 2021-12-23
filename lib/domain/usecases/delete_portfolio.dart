import 'package:either_dart/either.dart';

import '../../core/errors/failure.dart';
import '../../core/usecases/usecases.dart';
import '../repositories/repositories.dart';

class DeletePortfolio implements Usecase<DeletePortfolioParams, void> {
  final ApiRepository apiRepository;
  DeletePortfolio({
    required this.apiRepository,
  });
  @override
  Future<Either<Failure, void>> call(DeletePortfolioParams params) async {
    return await apiRepository.deletePortfolio(params);
  }
}

class DeletePortfolioParams {
  final String email;
  final String guid;
  DeletePortfolioParams({
    required this.guid,
    required this.email,
  });
}
