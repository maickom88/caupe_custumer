import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../core/theme/theme.dart';
import '../../../domain/usecases/send_email_verification.dart';
import '../../../domain/usecases/usecases.dart';

class VerifiedController extends GetxController {
  final SendEmailVerification sendEmailVerification;
  late String email;
  late String password;

  VerifiedController({
    required this.sendEmailVerification,
  });

  @override
  void onInit() {
    email = Get.arguments['email'];
    password = Get.arguments['password'];
    super.onInit();
  }

  void sendVerification() async {
    AppDefault.showDefaultLoad();
    final result = await sendEmailVerification
        .call(LoginParams(email: email, password: password));
    AppDefault.close();
    result.fold((left) {
      AppDefault.showSnackBarError(
        title: 'Error ao tentar enviar email',
        message: left.message,
      );
    }, (right) async {
      Get.back();
    });
  }
}
