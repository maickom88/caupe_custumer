import '../../../factories/build_help/build_evaluetion_help.dart';
import '../../../factories/build_help/build_get_helps.dart';
import '../../../factories/build_help/build_get_problem.dart';
import '../../../factories/build_login/build_login.dart';
import 'package:get/get.dart';

import 'help.dart';

class HelpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HelpController(
        getHelps: buildgetHelps(),
        getOrCreateUser: buildGetOrCreateUser(),
        evaluetionHelp: buildEvaluetionHelp(),
        getProblem: buildGetProblem(),
      ),
    );
  }
}
