import 'package:either_dart/either.dart';

import '../../core/errors/failure.dart';
import '../../core/usecases/usecases.dart';
import '../entities/portfolio_entity.dart';
import '../repositories/repositories.dart';

class GetPortfolios implements Usecase<String, List<PortfolioEntity>> {
  final ApiRepository apiRepository;
  GetPortfolios({
    required this.apiRepository,
  });
  @override
  Future<Either<Failure, List<PortfolioEntity>>> call(String params) async {
    return await apiRepository.getPortfolios(params);
  }
}
