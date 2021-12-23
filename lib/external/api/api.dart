import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

import '../../core/errors/errors.dart';
import '../../data/datasources/datasources.dart';
import '../../data/models/available_model.dart';
import '../../data/models/category_model.dart';
import '../../data/models/city_model.dart';
import '../../data/models/evaluetion_help_model.dart';
import '../../data/models/helps_model.dart';
import '../../data/models/information_model.dart';
import '../../data/models/portfolio_model.dart';
import '../../data/models/problem_model.dart';
import '../../data/models/service_model.dart';
import '../../data/models/terms_model.dart';
import '../../data/models/user_model.dart';
import '../../domain/entities/auth_response_entity.dart';
import '../../domain/usecases/create_portifolio.dart';
import '../../domain/usecases/delete_portfolio.dart';
import '../../domain/usecases/evaluetion_help.dart';
import '../../domain/usecases/save_available.dart';
import '../../domain/usecases/save_cities.dart';
import '../../domain/usecases/update_photo_avatar.dart';
import '../../domain/usecases/update_serivce.dart';

class Api implements ApiDatasource {
  final Dio dio;
  final _firebaseStorage = FirebaseStorage.instance;

  Api({required this.dio});

  @override
  Future<PortfolioModel> createPortfolio(PortfolioParams params) async {
    try {
      final upload = await _firebaseStorage
          .ref('${params.email}/portfolio')
          .child(basename(params.file.path))
          .putFile(params.file);
      final link = await upload.ref.getDownloadURL();
      final data = {"guid_user": params.guidUser, "link": link};
      final result =
          await dio.post<Map<String, dynamic>>('/portfolio', data: data);
      return PortfolioModel.fromMap(result.data!);
    } catch (e) {
      throw ServerError();
    }
  }

  @override
  Future<void> deletePortfolio(DeletePortfolioParams params) async {
    try {
      await dio.delete('/portfolio/${params.guid}');
    } catch (e) {
      throw ServerError();
    }
  }

  @override
  Future<List<CityModel>> getAvailableCities(String params) {
    // TODO: implement getAvailableCities
    throw UnimplementedError();
  }

  @override
  Future<List<AvailableModel>> getAvailables(String params) async {
    try {
      final result = await dio.get<List?>('/available/user/$params');
      if (result.data == null) {
        result.data = [];
      }
      final availables = result.data!
          .map((available) => AvailableModel.fromMap(available))
          .toList();
      return availables;
    } catch (e) {
      throw ServerError();
    }
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      final result = await dio.get<List<dynamic>>('/type-service');
      final locations = result.data!
          .map((location) => CategoryModel.fromMap(location))
          .toList();
      return locations;
    } catch (e) {
      throw ServerError();
    }
  }

  @override
  Future<List<CityModel>> getCities() async {
    try {
      final result = await dio.get<List<dynamic>>('/location');
      final locations =
          result.data!.map((location) => CityModel.fromMap(location)).toList();
      return locations;
    } catch (e) {
      throw ServerError();
    }
  }

  @override
  Future<UserModel> getOrCreateUser(AuthResponse params) async {
    try {
      final data = params.toMap(firstAccess: false);
      final result = await dio.post<Map<String, dynamic>>('/user', data: data);
      return UserModel.fromMap(result.data!);
    } catch (e) {
      print(e);
      throw ServerError();
    }
  }

  @override
  Future<List<PortfolioModel>> getPortfolios(String params) async {
    try {
      final result = await dio.get<List>('/portfolio/user/$params');
      final portfolios = result.data!
          .map((portfolio) => PortfolioModel.fromMap(portfolio))
          .toList();
      return portfolios;
    } catch (e) {
      throw ServerError();
    }
  }

  @override
  Future<List<ServiceModel>> getServices(String params) async {
    try {
      final result = await dio.get<List>('/service/user/$params');
      final services =
          result.data!.map((service) => ServiceModel.fromMap(service)).toList();
      return services;
    } catch (e) {
      throw ServerError();
    }
  }

  @override
  Future<AvailableModel> saveAvailable(AvailableParams params) async {
    try {
      final data = AvailableModel.fromModel(params.available).toMap();
      data['guid_user'] = params.guidUser;
      if (params.available.guid == null) {
        final result =
            await dio.post<Map<String, dynamic>>('/available', data: data);
        final available = AvailableModel.fromMap(result.data!);
        return available;
      }
      final result =
          await dio.put<Map<String, dynamic>>('/available', data: data);
      final available = AvailableModel.fromMap(result.data!);
      return available;
    } catch (e) {
      throw ServerError();
    }
  }

  @override
  Future<CityModel> saveCities(CitiesParams params) async {
    try {
      final result = await dio.post<Map<String, dynamic>>(
          '/information/location-vincule/${params.guidInformation}/${params.guidLocation}');
      return CityModel.fromMap(result.data!);
    } catch (e) {
      print(e);
      throw ServerError();
    }
  }

  @override
  Future<InformationModel> updateInformationUser(UserModel params) async {
    try {
      final data = params.toData();
      print(params.photo);
      final result =
          await dio.put<Map<String, dynamic>>('/information', data: data);
      return InformationModel.fromMap(result.data!);
    } catch (e) {
      throw ServerError();
    }
  }

  @override
  Future<String> updatePhotoAvatar(AvatarParams params) async {
    try {
      final upload = await _firebaseStorage
          .ref(params.email)
          .child('avatar')
          .putFile(params.file);
      return await upload.ref.getDownloadURL();
    } catch (e) {
      throw ServerError();
    }
  }

  Future<ServiceModel> _saveServiceValues(
      ServiceParams params, String guiService) async {
    params.service.value.forEach((element) async {
      final data = {
        'hours': element.hours.toIso8601String(),
        'price': element.price,
        'guid_service': guiService,
        'guid_sub_category': element.guid,
      };
      await dio.post<Map<String, dynamic>>('/service-values', data: data);
    });
    final result = await dio.get<Map<String, dynamic>>('/service/$guiService');
    return ServiceModel.fromMap(result.data!);
  }

  @override
  Future<ServiceModel> updateService(ServiceParams params) async {
    try {
      final data = {
        'guid': params.service.guid,
        'guid_user': params.guidUser,
        'guid_type_service': params.service.typeService.guid,
      };
      final result =
          await dio.post<Map<String, dynamic>>('/service', data: data);
      return await _saveServiceValues(params, result.data!['guid']);
    } catch (e) {
      throw ServerError();
    }
  }

  @override
  Future<List<HelpsModel>> getHelps(String params) async {
    try {
      final result = await dio.get<List>('/help?email=$params');
      final helps =
          result.data!.map((help) => HelpsModel.fromMap(help)).toList();
      return helps;
    } catch (e) {
      throw ServerError();
    }
  }

  @override
  Future<void> deleteCityAvailable(CitiesParams params) async {
    try {
      await dio.delete(
          '/information/location-vincule/${params.guidInformation}/${params.guidLocation}');
    } catch (e) {
      print(e);
      throw ServerError();
    }
  }

  @override
  Future<void> deleteAvailable(String params) async {
    try {
      await dio.delete('/available/$params');
    } catch (e) {
      print(e);
      throw ServerError();
    }
  }

  @override
  Future<void> deleteService(String params) async {
    try {
      await dio.delete('/service/$params');
    } catch (e) {
      print(e);
      throw ServerError();
    }
  }

  @override
  Future<EvaluetionHelpModel> evaluetionHelp(
      EvaluetionHelpParams params) async {
    try {
      final data = params.toMap();
      final result =
          await dio.post<Map<String, dynamic>>('/help-like', data: data);
      return EvaluetionHelpModel.fromMap(result.data!);
    } catch (e) {
      throw ServerError();
    }
  }

  @override
  Future<TermsModel> getTerms() async {
    try {
      final result = await dio.get<List>('/term-of-condition');
      return TermsModel.fromMap(result.data!.first);
    } catch (e) {
      throw ServerError();
    }
  }

  @override
  Future<List<ProblemModel>> getProblem() async {
    try {
      final result = await dio.get<List>('/problem');
      final problems =
          result.data!.map((help) => ProblemModel.fromMap(help)).toList();
      return problems;
    } catch (e) {
      throw ServerError();
    }
  }
}
