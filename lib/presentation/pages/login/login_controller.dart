import 'package:get/get.dart';

import '../../../core/constants/routes_constants.dart';
import '../../../core/enums/enums.dart';
import '../../../core/errors/failure.dart';
import '../../../core/theme/app_default.dart';
import '../../../core/usecases/usecases.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/usecases/get_user.dart';
import '../../../domain/usecases/login_social_usecase.dart';
import '../../../domain/usecases/usecases.dart';

class LoginController extends GetxController {
  final LoginWithSocial loginWithSocial;
  final LoginWithEmailAndPassword loginWithEmailAndPassword;
  final Logout logout;
  final GetOrCreateUser getOrCreateUser;
  LoginController({
    required this.loginWithSocial,
    required this.loginWithEmailAndPassword,
    required this.logout,
    required this.getOrCreateUser,
  });

  void loginSocial(TypeProviderSocial provider) async {
    AppDefault.showDefaultLoad();
    final result = await loginWithSocial.call(provider);
    AppDefault.close();
    result.fold((left) {
      if (!(left is LoginCancel))
        AppDefault.showSnackBarError(
          title: 'Error ao tentar fazer login',
          message: left.message,
        );
    }, (right) {
      getOrCreate(right);
    });
  }

  void login({required String email, required String password}) async {
    AppDefault.showDefaultLoad();
    final result = await loginWithEmailAndPassword.call(
      LoginParams(email: email, password: password),
    );
    AppDefault.close();
    result.fold((left) {
      if (!(left is LoginCancel))
        AppDefault.showSnackBarError(
          title: 'Error ao tentar fazer login',
          message: left.message,
        );
    }, (right) async {
      if (!right.isEmailVerified!) {
        await signOut();
        Get.toNamed(RoutesConsts.verified,
            arguments: {"email": email, "password": password});
      } else {
        getOrCreate(right);
      }
    });
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

  Future<void> getOrCreate(AuthResponse authResponse) async {
    AppDefault.showDefaultLoad();
    final result = await getOrCreateUser.call(authResponse);
    AppDefault.close();
    result.fold((left) {
      AppDefault.showSnackBarError(
        title: 'Error ao tentar logar.',
        message: left.message,
      );
    }, (right) {
      Get.offAllNamed(RoutesConsts.home);
    });
  }
}
