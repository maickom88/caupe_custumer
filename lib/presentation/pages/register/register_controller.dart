import 'package:get/get.dart';

import '../../../core/constants/constants.dart';
import '../../../core/theme/app_default.dart';
import '../../../core/usecases/usecases.dart';
import '../../../domain/usecases/logout.dart';
import '../../../domain/usecases/register_account.dart';
import '../validators/validators.dart';

class RegisterController extends GetxController {
  final RegisterAccount registerAccount;
  final Logout logout;
  RegisterController({
    required this.registerAccount,
    required this.logout,
  });

  bool startValidateName = false;
  bool startValidateDocument = false;
  bool startValidateEmail = false;
  bool startValidatePassword = false;
  RxString name = ''.obs;
  RxString document = ''.obs;
  RxString email = ''.obs;
  RxString password = ''.obs;

  register() async {
    if (_validateForm()) {
      AppDefault.showDefaultLoad();
      final result = await registerAccount.call(
        LoginParams(email: email.value, password: password.value),
      );
      AppDefault.close();
      result.fold((left) {
        AppDefault.showSnackBarError(
          title: 'Error ao tentar se cadastrar',
          message: left.message,
        );
      }, (right) async {
        if (!right.isEmailVerified!) {
          await signOut();
          Get.toNamed(RoutesConsts.verified,
              arguments: {"email": email.value, "password": password.value});
        } else {
          Get.offAllNamed(RoutesConsts.home);
        }
      });
    } else {
      AppDefault.showSnackBarError(
        message: 'Verifique os campos corretamente!',
        title: 'Error ao se cadastrar!',
      );
    }
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

  bool _validateForm() {
    if (Validators.validateDocument(document.value, startValidateDocument) ==
            null &&
        Validators.validateEmail(email.value, startValidateEmail) == null &&
        Validators.validatePassword(password.value, startValidatePassword) ==
            null) {
      return true;
    }
    return false;
  }
}
