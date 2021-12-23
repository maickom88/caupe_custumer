import 'dart:io';

import 'package:either_dart/either.dart';

import '../../core/errors/failure.dart';
import '../../core/usecases/usecases.dart';
import '../entities/portfolio_entity.dart';
import '../repositories/repositories.dart';

class CreatePortfolio implements Usecase<PortfolioParams, PortfolioEntity> {
  final ApiRepository apiRepository;
  CreatePortfolio({
    required this.apiRepository,
  });
  @override
  Future<Either<Failure, PortfolioEntity>> call(PortfolioParams params) async {
    return await apiRepository.createPortfolio(params);
  }
}

class PortfolioParams {
  final File file;
  final String email;
  final String guidUser;
  PortfolioParams({
    required this.file,
    required this.email,
    required this.guidUser,
  });
}
