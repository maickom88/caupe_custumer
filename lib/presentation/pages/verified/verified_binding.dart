import 'package:get/instance_manager.dart';

import '../../../factories/build_verified/build_email_verification.dart';
import 'verified.dart';

class VerifiedBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => VerifiedController(
        sendEmailVerification: buildSendEmailVerification(),
      ),
    );
  }
}
