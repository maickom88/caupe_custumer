import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../core/theme/app_animations.dart';
import '../../core/theme/app_default.dart';
import '../../core/theme/theme.dart';

class CaupeCompleteInformation extends StatelessWidget {
  final VoidCallback ontap;
  const CaupeCompleteInformation({
    Key? key,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      insetPadding: EdgeInsets.all(10),
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Material(
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: Get.back,
                ),
              ),
            ),
            AppDefault.defaultSpaceHeight(),
            LottieBuilder.asset(
              AppAnimations.completeInformation,
              height: Get.width.percent(80),
            ),
            AppDefault.defaultSpaceHeight(),
            Text(
              'Very good',
              textAlign: TextAlign.center,
              style: AppTypography.t28WithW800(),
            ),
            Text(
              'Now all you have to do is complete your information.',
              textAlign: TextAlign.center,
              style: AppTypography.t18(),
            ),
            AppDefault.defaultSpaceHeight(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: ontap,
                child: Text('Go now'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
