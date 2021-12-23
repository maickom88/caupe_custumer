import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../core/constants/constants.dart';
import '../../../core/theme/theme.dart';
import '../../../core/usecases/usecases.dart';
import '../../../data/models/auth_response_model.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/get_user.dart';
import '../../../domain/usecases/usecases.dart';
import '../../components/components.dart';
import 'nav/nav.dart';

class HomeController extends GetxController {
  final Logout logout;
  final GetOrCreateUser getOrCreateUser;
  HomeController({
    required this.logout,
    required this.getOrCreateUser,
  });

  Rx<UserEntity?> user = Rx(null);
  late AuthResponseModel authResponseModel;
  @override
  void onInit() {
    if (GetStorage().hasData('hideComplete')) {
      showCompleteInformation();
    }

    getUser(getUserInformation());
    super.onInit();
  }

  Future<void> getUser(AuthResponseModel authResponse) async {
    final result = await getOrCreateUser.call(authResponse);
    result.fold((left) async {
      await signOut();
    }, (right) {
      user.value = right;
      update();
    });
  }

  AuthResponseModel getUserInformation() {
    final basicInformation =
        GetStorage().read<Map<String, dynamic>>('userInformation');
    if (basicInformation == null) {
      Get.back();
      print(basicInformation);
    }
    authResponseModel = AuthResponseModel.fromMap(basicInformation!);
    update();
    return authResponseModel;
  }

  Future<void> showCompleteInformation() async {
    await Future.delayed(Duration(seconds: 10), () {
      Get.dialog(
        CaupeCompleteInformation(
          ontap: () => Get.toNamed(RoutesConsts.profile),
        ),
        transitionDuration: Duration(milliseconds: 290),
        transitionCurve: Curves.bounceInOut,
      );
    });
    await GetStorage().write('hideComplete', true);
  }

  Future<void> signOut() async {
    AppDefault.showDefaultLoad();
    final result = await logout.call(NoParams());
    AppDefault.close();
    result.fold((left) {
      AppDefault.showSnackBarError(
        title: 'Error ao tentar desconnectar conta',
        message: left.message,
      );
    }, (right) {
      Get.offAllNamed(RoutesConsts.login);
    });
  }
}

class NavigationController {
  static List<Widget> navs = [
    HomeNav(),
    CalenderNav(),
    FinanceNav(),
    ReviewsNav(),
  ];
}
