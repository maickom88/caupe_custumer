import '../../domain/entities/entities.dart';
import '../../domain/usecases/create_portifolio.dart';
import '../../domain/usecases/delete_portfolio.dart';
import '../../domain/usecases/evaluetion_help.dart';
import '../../domain/usecases/save_available.dart';
import '../../domain/usecases/save_cities.dart';
import '../../domain/usecases/update_photo_avatar.dart';
import '../../domain/usecases/update_serivce.dart';
import '../models/available_model.dart';
import '../models/category_model.dart';
import '../models/evaluetion_help_model.dart';
import '../models/helps_model.dart';
import '../models/information_model.dart';
import '../models/models.dart';
import '../models/portfolio_model.dart';
import '../models/problem_model.dart';
import '../models/terms_model.dart';

abstract class ApiDatasource {
  Future<UserModel> getOrCreateUser(AuthResponse params);
  Future<void> deleteAvailable(String params);
  Future<List<HelpsModel>> getHelps(String params);
  Future<InformationModel> updateInformationUser(UserModel params);
  Future<EvaluetionHelpModel> evaluetionHelp(EvaluetionHelpParams params);
  Future<PortfolioModel> createPortfolio(PortfolioParams params);
  Future<List<PortfolioModel>> getPortfolios(String params);
  Future<void> deletePortfolio(DeletePortfolioParams params);
  Future<List<CategoryModel>> getCategories();
  Future<List<CityModel>> getCities();
  Future<List<ServiceModel>> getServices(String params);
  Future<ServiceModel> updateService(ServiceParams params);
  Future<CityModel> saveCities(CitiesParams params);
  Future<void> deleteCityAvailable(CitiesParams params);
  Future<void> deleteService(String params);
  Future<AvailableModel> saveAvailable(AvailableParams params);
  Future<List<AvailableModel>> getAvailables(String params);
  Future<List<CityModel>> getAvailableCities(String params);
  Future<String> updatePhotoAvatar(AvatarParams params);
  Future<TermsModel> getTerms();
  Future<List<ProblemModel>> getProblem();
}