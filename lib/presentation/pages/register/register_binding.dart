import 'package:get/instance_manager.dart';

import '../../../factories/build_home/build_logout.dart';
import '../../../factories/build_register/build_register_account.dart';
import 'register_controller.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController(
          registerAccount: buildRegisterAccount(),
          logout: buildLogout(),
        ));
  }
}
