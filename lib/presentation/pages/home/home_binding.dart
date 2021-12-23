import 'package:get/instance_manager.dart';

import '../../../factories/build_home/build_logout.dart';
import '../../../factories/build_login/build_login.dart';
import 'home.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(
        logout: buildLogout(),
        getOrCreateUser: buildGetOrCreateUser(),
      ),
    );
  }
}
