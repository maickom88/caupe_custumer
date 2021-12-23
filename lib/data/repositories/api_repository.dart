import 'package:either_dart/either.dart';

import '../../core/errors/failure.dart';
import '../../domain/entities/available_entity.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/city_entity.dart';
import '../../domain/entities/entities.dart';
import '../../domain/entities/evaluetion_help_entity.dart';
import '../../domain/entities/helps_entity.dart';
import '../../domain/entities/information_entity.dart';
import '../../domain/entities/portfolio_entity.dart';
import '../../domain/entities/problem_entity.dart';
import '../../domain/entities/service_entity.dart';
import '../../domain/entities/terms_entity.dart';
import '../../domain/repositories/repositories.dart';
import '../../domain/usecases/create_portifolio.dart';
import '../../domain/usecases/delete_portfolio.dart';
import '../../domain/usecases/evaluetion_help.dart';
import '../../domain/usecases/save_available.dart';
import '../../domain/usecases/save_cities.dart';
import '../../domain/usecases/update_photo_avatar.dart';
import '../../domain/usecases/update_serivce.dart';
import '../datasources/datasources.dart';
import '../models/models.dart';

class Api implements ApiRepository {
  final ApiDatasource apiDatasource;
  Api({
    required this.apiDatasource,
  });
  @override
  Future<Either<Failure, UserEntity>> getOrCreateUser(
      AuthResponse params) async {
    try {
      return Right(await apiDatasource.getOrCreateUser(params));
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, InformationEntity>> updateInformationUser(
      UserEntity params) async {
    try {
      return Right(await apiDatasource
          .updateInformationUser(UserModel.fromModel(params)));
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, PortfolioEntity>> createPortfolio(
      PortfolioParams params) async {
    try {
      return Right(await apiDatasource.createPortfolio(params));
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, List<PortfolioEntity>>> getPortfolios(
      String params) async {
    try {
      return Right(await apiDatasource.getPortfolios(params));
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, void>> deletePortfolio(
      DeletePortfolioParams params) async {
    try {
      return Right(await apiDatasource.deletePortfolio(params));
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      return Right(await apiDatasource.getCategories());
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, List<ServiceEntity>>> getServices(
      String params) async {
    try {
      return Right(await apiDatasource.getServices(params));
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, ServiceEntity>> updateService(
      ServiceParams params) async {
    try {
      return Right(await apiDatasource.updateService(params));
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, List<CityEntity>>> getCities() async {
    try {
      return Right(await apiDatasource.getCities());
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, CityEntity>> saveCities(CitiesParams params) async {
    try {
      return Right(await apiDatasource.saveCities(params));
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, List<CityEntity>>> getAvailableCities(
      String params) async {
    try {
      return Right(await apiDatasource.getAvailableCities(params));
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, AvailableEntity>> saveAvailable(
      AvailableParams params) async {
    try {
      return Right(await apiDatasource.saveAvailable(params));
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, List<AvailableEntity>>> getAvailables(
      String params) async {
    try {
      return Right(await apiDatasource.getAvailables(params));
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, String>> updatePhotoAvatar(AvatarParams params) async {
    try {
      return Right(await apiDatasource.updatePhotoAvatar(params));
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, List<HelpsEntity>>> getHelps(String params) async {
    try {
      return Right(await apiDatasource.getHelps(params));
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, void>> deleteCityAvailable(CitiesParams params) async {
    try {
      return Right(await apiDatasource.deleteCityAvailable(params));
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, void>> deleteAvailable(String params) async {
    try {
      return Right(await apiDatasource.deleteAvailable(params));
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, void>> deleteService(String params) async {
    try {
      return Right(await apiDatasource.deleteService(params));
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, EvaluetionHelpEntity>> evaluetionHelp(
      EvaluetionHelpParams params) async {
    try {
      return Right(await apiDatasource.evaluetionHelp(params));
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, TermsEntity>> getTerms() async {
    try {
      return Right(await apiDatasource.getTerms());
    } on Failure catch (error) {
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, List<ProblemEntity>>> getProblem() async {
    try {
      return Right(await apiDatasource.getProblem());
    } on Failure catch (error) {
      return Left(error);
    }
  }
}
