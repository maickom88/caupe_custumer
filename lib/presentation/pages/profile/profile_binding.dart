import 'package:caupe_custumer/factories/build_profile/build_delete_service.dart';
import 'package:get/instance_manager.dart';

import '../../../factories/build_login/build_login.dart';
import '../../../factories/build_profile/build_create_portfolio.dart';
import '../../../factories/build_profile/build_delete_available_hours.dart';
import '../../../factories/build_profile/build_delete_city_available.dart';
import '../../../factories/build_profile/build_delete_portfolio.dart';
import '../../../factories/build_profile/build_get_availables.dart';
import '../../../factories/build_profile/build_get_cities.dart';
import '../../../factories/build_profile/build_get_portfolios.dart';
import '../../../factories/build_profile/build_get_services.dart';
import '../../../factories/build_profile/build_save_available.dart';
import '../../../factories/build_profile/build_save_cities.dart';
import '../../../factories/build_profile/build_send_phone_auth.dart';
import '../../../factories/build_profile/build_sign_in_with_phone.dart';
import '../../../factories/build_profile/build_update_photo_url.dart';
import '../../../factories/build_profile/build_update_service.dart';
import '../../../factories/build_profile/build_update_user_informations.dart';
import 'profile_controller.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ProfileController(
        sendPhoneAuth: buildSendPhoneAuth(),
        signInWithPhone: buildSignInWithPhone(),
        getOrCreateUser: buildGetOrCreateUser(),
        updateInformationUser: buildUpdateUserInformation(),
        createPortfolio: buildCreatePortfolio(),
        getPortfolios: buildGetPortfolios(),
        deletePortfolio: buildDeletePortfolio(),
        getServices: buildGetServices(),
        updateService: buildUpdateService(),
        getCities: buildGetCities(),
        saveCities: buildSaveCities(),
        saveAvailable: buildSaveAvailable(),
        getAvailables: buildGetAvailables(),
        updatePhotoAvatar: buildUpdatePhotoAvatar(),
        deleteCityAvailable: deleteCityAvailable(),
        deleteAvailable: buildDeleteAvailable(),
        deleteService: buildDeleteService(),
      ),
    );
  }
}
