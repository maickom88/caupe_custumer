import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lottie/lottie.dart';

import '../../../core/theme/theme.dart';
import 'verified.dart';

class VerifiedPage extends GetView<VerifiedController> {
  const VerifiedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          AppDefault.defaultSpaceHeight(),
          AppDefault.defaultSpaceHeight(),
          Lottie.asset(AppAnimations.verifiedEmail02),
          AppDefault.defaultSpaceHeight(),
          Text(
            'An email has been sent',
            textAlign: TextAlign.center,
            style: AppTypography.t28WithW800(),
          ).withBottomPadding(),
          Text(
            'Check your email inbox to verify your account to access the platform!',
            textAlign: TextAlign.center,
            style: AppTypography.t16(),
          ),
          AppDefault.defaultSpaceHeight(height: 35),
          ElevatedButton(
            onPressed: controller.sendVerification,
            child: Text('Send again'),
          )
        ],
      ).withAllPadding(),
    );
  }
}
