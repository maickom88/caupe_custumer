import 'package:either_dart/either.dart';

import '../../core/errors/errors.dart';
import '../entities/available_entity.dart';
import '../entities/category_entity.dart';
import '../entities/city_entity.dart';
import '../entities/entities.dart';
import '../entities/evaluetion_help_entity.dart';
import '../entities/helps_entity.dart';
import '../entities/information_entity.dart';
import '../entities/portfolio_entity.dart';
import '../entities/problem_entity.dart';
import '../entities/service_entity.dart';
import '../entities/terms_entity.dart';
import '../usecases/create_portifolio.dart';
import '../usecases/delete_portfolio.dart';
import '../usecases/evaluetion_help.dart';
import '../usecases/save_available.dart';
import '../usecases/save_cities.dart';
import '../usecases/update_photo_avatar.dart';
import '../usecases/update_serivce.dart';

abstract class ApiRepository {
  Future<Either<Failure, UserEntity>> getOrCreateUser(AuthResponse params);
  Future<Either<Failure, void>> deleteAvailable(String params);
  Future<Either<Failure, List<HelpsEntity>>> getHelps(String params);
  Future<Either<Failure, TermsEntity>> getTerms();
  Future<Either<Failure, List<ProblemEntity>>> getProblem();
  Future<Either<Failure, EvaluetionHelpEntity>> evaluetionHelp(
      EvaluetionHelpParams params);
  Future<Either<Failure, InformationEntity>> updateInformationUser(
      UserEntity params);
  Future<Either<Failure, PortfolioEntity>> createPortfolio(
      PortfolioParams params);
  Future<Either<Failure, List<PortfolioEntity>>> getPortfolios(String params);
  Future<Either<Failure, void>> deletePortfolio(DeletePortfolioParams params);
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
  Future<Either<Failure, List<CityEntity>>> getCities();
  Future<Either<Failure, List<ServiceEntity>>> getServices(String params);
  Future<Either<Failure, ServiceEntity>> updateService(ServiceParams params);
  Future<Either<Failure, CityEntity>> saveCities(CitiesParams params);
  Future<Either<Failure, void>> deleteCityAvailable(CitiesParams params);
  Future<Either<Failure, void>> deleteService(String params);
  Future<Either<Failure, AvailableEntity>> saveAvailable(
      AvailableParams params);
  Future<Either<Failure, List<CityEntity>>> getAvailableCities(String params);
  Future<Either<Failure, List<AvailableEntity>>> getAvailables(String params);
  Future<Either<Failure, String>> updatePhotoAvatar(AvatarParams params);
}
