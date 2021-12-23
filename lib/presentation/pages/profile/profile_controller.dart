import 'package:extended_image/extended_image.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../core/enums/enums.dart';
import '../../../core/theme/theme.dart';
import '../../../core/usecases/usecases.dart';
import '../../../data/models/models.dart';
import '../../../domain/entities/available_entity.dart';
import '../../../domain/entities/city_entity.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/entities/portfolio_entity.dart';
import '../../../domain/entities/service_entity.dart';
import '../../../domain/usecases/create_portifolio.dart';
import '../../../domain/usecases/delete_available.dart';
import '../../../domain/usecases/delete_city_available.dart';
import '../../../domain/usecases/delete_portfolio.dart';
import '../../../domain/usecases/delete_service.dart';
import '../../../domain/usecases/get_availables.dart';
import '../../../domain/usecases/get_cities.dart';
import '../../../domain/usecases/get_portfolios.dart';
import '../../../domain/usecases/get_services.dart';
import '../../../domain/usecases/get_user.dart';
import '../../../domain/usecases/save_available.dart';
import '../../../domain/usecases/save_cities.dart';
import '../../../domain/usecases/update_infomations_user.dart';
import '../../../domain/usecases/update_photo_avatar.dart';
import '../../../domain/usecases/update_serivce.dart';
import '../../../domain/usecases/usecases.dart';

class ProfileController extends GetxController {
  final SendPhoneAuth sendPhoneAuth;
  final SignInWithPhone signInWithPhone;
  final GetOrCreateUser getOrCreateUser;
  final CreatePortfolio createPortfolio;
  final GetPortfolios getPortfolios;
  final DeletePortfolio deletePortfolio;
  final GetServices getServices;
  final UpdateInformationUser updateInformationUser;
  final UpdateService updateService;
  final SaveCities saveCities;
  final GetCities getCities;
  final SaveAvailable saveAvailable;
  final GetAvailables getAvailables;
  final UpdatePhotoAvatar updatePhotoAvatar;
  final DeleteCityAvailable deleteCityAvailable;
  final DeleteAvailable deleteAvailable;
  final DeleteService deleteService;

  ProfileController({
    required this.updatePhotoAvatar,
    required this.deleteService,
    required this.deleteAvailable,
    required this.deleteCityAvailable,
    required this.getAvailables,
    required this.saveAvailable,
    required this.saveCities,
    required this.getCities,
    required this.updateService,
    required this.getServices,
    required this.deletePortfolio,
    required this.getPortfolios,
    required this.createPortfolio,
    required this.updateInformationUser,
    required this.sendPhoneAuth,
    required this.signInWithPhone,
    required this.getOrCreateUser,
  });

  RxList<TypeDay> selectedDays = <TypeDay>[].obs;
  late AuthResponseModel authResponseModel;
  Rx<UserEntity?> user = Rx(null);
  RxList<PortfolioEntity> portfolioEntity = <PortfolioEntity>[].obs;
  RxList<ServiceEntity> services = <ServiceEntity>[].obs;
  RxList<CityEntity> cities = <CityEntity>[].obs;
  RxList<CityEntity> citiesAvailable = <CityEntity>[].obs;
  RxList<AvailableEntity> availables = <AvailableEntity>[].obs;
  RxBool loadService = false.obs;

  @override
  Future<void> onInit() async {
    authResponseModel = getUserInformation();
    await getUser(authResponseModel);
    AppDefault.showDefaultLoad();
    await Future.wait([
      getPhotosPortfolio(),
      getAllServices(),
      getAllCities(),
      getAllAvailables(),
    ]);
    AppDefault.close();
    super.onInit();
  }

  Future<void> getUser(AuthResponseModel authResponse) async {
    final result = await getOrCreateUser.call(authResponse);
    result.fold((left) async {
      Get.back();
    }, (right) {
      user.value = right;
    });
  }

  Future<void> getPhotosPortfolio() async {
    final result = await getPortfolios.call(user.value!.guid);
    result.fold((left) async {
      AppDefault.showSnackBarError(
        title: 'Error ao tentar atualizar!',
        message: left.message,
      );
    }, (right) {
      portfolioEntity.value = right;
    });
  }

  Future<void> getAllServices() async {
    final result = await getServices.call(user.value!.guid);
    result.fold((left) async {
      AppDefault.showSnackBarError(
        title: 'Error ao recuperar serviços!',
        message: left.message,
      );
    }, (right) {
      services.value = right;
    });
  }

  Future<void> getAllAvailables() async {
    final result = await getAvailables.call(user.value!.guid);
    result.fold((left) async {
      AppDefault.showSnackBarError(
        title: 'Error ao recuperar serviços!',
        message: left.message,
      );
    }, (right) {
      availables.value = right;
    });
  }

  Future<void> getAllCities() async {
    final result = await getCities.call(NoParams());
    result.fold((left) async {
      AppDefault.showSnackBarError(
        title: 'Error ao recuperar cidades!',
        message: left.message,
      );
    }, (right) {
      cities.value = right;
    });
  }

  Future<void> deleteAService(String guid, int index) async {
    AppDefault.showDefaultLoad();
    services.removeAt(index);
    final result = await deleteService.call(guid);
    result.fold((left) async {
      AppDefault.showSnackBarError(
        title: 'Error ao deletar serviço',
        message: left.message,
      );
    }, (right) {});
    AppDefault.close();
  }

  Future<void> updateAllService(ServiceEntity service) async {
    final params = ServiceParams(guidUser: user.value!.guid, service: service);
    final result = await updateService.call(params);
    await result.fold((left) async {
      AppDefault.showSnackBarError(
        title: 'Error ao atualizar serviços!',
        message: left.message,
      );
    }, (right) {
      services.add(right);
      getAllServices();
    });
  }

  Future<void> updateAvailableCities(CityEntity city) async {
    AppDefault.showDefaultLoad();
    final params = CitiesParams(
        guidLocation: city.guid,
        guidInformation: user.value!.information!.guid!);
    final result = await saveCities.call(params);
    AppDefault.close();
    result.fold((left) async {
      AppDefault.showSnackBarError(
        title: 'Error ao tentar atualizar cidade!',
        message: left.message,
      );
    }, (right) {
      citiesAvailable.add(right);
    });
  }

  Future<void> deleteCity(CityEntity city) async {
    AppDefault.showDefaultLoad();
    final params = CitiesParams(
        guidLocation: city.guid,
        guidInformation: user.value!.information!.guid!);
    final result = await deleteCityAvailable.call(params);
    AppDefault.close();
    result.fold((left) async {
      AppDefault.showSnackBarError(
        title: 'Error ao tentar excluir cidade!',
        message: left.message,
      );
    }, (right) {});
  }

  Future<void> updateAllAvailable(AvailableEntity available) async {
    AppDefault.showDefaultLoad();
    final params =
        AvailableParams(available: available, guidUser: user.value!.guid);
    final result = await saveAvailable.call(params);
    AppDefault.close();
    result.fold((left) async {
      AppDefault.showSnackBarError(
        title: 'Error ao atualizar os dias e horas!',
        message: left.message,
      );
    }, (right) {
      if (available.guid == null) {
        availables.add(right);
      }
    });
  }

  Future<void> deleteAvailableHours(String guid) async {
    AppDefault.showDefaultLoad();
    final result = await deleteAvailable.call(guid);
    AppDefault.close();
    result.fold(
      (left) async {
        AppDefault.showSnackBarError(
          title: 'Error ao atualizar os dias e horas!',
          message: left.message,
        );
      },
      (right) {},
    );
  }

  Future<void> updateInformation() async {
    AppDefault.showDefaultLoad();
    final result = await updateInformationUser.call(user.value!);
    AppDefault.close();
    result.fold(
      (left) async {
        AppDefault.showSnackBarError(
          title: 'Error ao tentar atualizar!',
          message: left.message,
        );
      },
      (right) {
        user.refresh();
      },
    );
  }

  AuthResponseModel getUserInformation() {
    final basicInformation =
        GetStorage().read<Map<String, dynamic>>('userInformation');
    if (basicInformation == null) {
      Get.back();
    }
    return AuthResponseModel.fromMap(basicInformation!);
  }

  Future<void> saveUserInformation(AuthResponseModel authResponseModel) async {
    await GetStorage().write('userInformation', authResponseModel.toMap());
  }

  Future<void> sendSmsPhoneAuthentication(String phone) async {
    AppDefault.showDefaultLoad();
    final result = await sendPhoneAuth.call(phone);
    AppDefault.close();
    result.fold((left) {
      AppDefault.showSnackBarError(
        title: 'Error ao tentar enviar codigo',
        message: left.message,
      );
    }, (right) {});
  }

  Future<void> authenticationPhoneWithCode(String otp, String phone) async {
    AppDefault.showDefaultLoad();
    final result = await signInWithPhone.call(otp);
    AppDefault.close();
    result.fold((left) {
      AppDefault.showSnackBarError(
        title: 'Error ao tentar autenticar dispositivo',
        message: left.message,
      );
    }, (right) async {
      user.value?.information?.phone = phone;
      await updateInformation();
      Get.back();
    });
  }

  Future<void> addPhotoPortfolio(List<File> files) async {
    files.forEach((file) async {
      AppDefault.showDefaultLoad();
      final params = PortfolioParams(
        email: authResponseModel.email!,
        file: file,
        guidUser: user.value!.guid,
      );
      final result = await createPortfolio.call(params);
      AppDefault.close();
      result.fold((left) {
        AppDefault.showSnackBarError(
          title: 'Error ao tentar adicionar foto',
          message: left.message,
        );
      }, (right) async {
        portfolioEntity.add(right);
      });
    });
  }

  Future<void> updateAvatar(File file) async {
    AppDefault.showDefaultLoad();
    final params = AvatarParams(email: authResponseModel.email!, file: file);
    final result = await updatePhotoAvatar.call(params);
    AppDefault.close();
    result.fold((left) {
      AppDefault.showSnackBarError(
        title: 'Error ao tentar atualizar foto de perfil',
        message: left.message,
      );
    }, (right) async {
      authResponseModel.photoUrl = right;
      user.value?.photo = right;
      print(right);
      await updateInformation();
      await saveUserInformation(authResponseModel);
      user.refresh();
    });
  }

  Future<void> deletePhotoPortfolio(String guid) async {
    AppDefault.showDefaultLoad();
    final params =
        DeletePortfolioParams(email: authResponseModel.email!, guid: guid);
    final result = await deletePortfolio.call(params);
    AppDefault.close();
    result.fold(
      (left) {
        AppDefault.showSnackBarError(
          title: 'Error ao tentar excluir foto',
          message: left.message,
        );
      },
      (right) {
        portfolioEntity.refresh();
      },
    );
  }
}

class DotsNavigation extends GetxController {
  static RxInt indexPage = 0.obs;
}
