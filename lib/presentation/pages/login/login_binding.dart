import 'package:get/instance_manager.dart';

import '../../../factories/build_home/build_logout.dart';
import '../../../factories/build_login/build_login.dart';
import 'login.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginController(
        loginWithSocial: builLoginWithSocial(),
        loginWithEmailAndPassword: buildLoginWithEmailAndPassword(),
        logout: buildLogout(),
        getOrCreateUser: buildGetOrCreateUser(),
      ),
    );
  }
}
