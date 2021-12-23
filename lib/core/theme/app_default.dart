import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../presentation/components/components.dart';

class AppDefault {
  static const double hPadding = 14;
  static const double vPadding = 10;

  static defaultBorderRadiusOnly({double topLeft = 40, double topRight = 40}) =>
      BorderRadius.only(
        topLeft: Radius.circular(topLeft),
        topRight: Radius.circular(topRight),
      );
  static defaultBorderRadius({double radius = 20}) =>
      BorderRadius.circular(radius);
  static SizedBox defaultSpaceHeight({double height = 20}) =>
      SizedBox(height: height);
  static SizedBox defaultSpaceWidth({double width = 10}) =>
      SizedBox(width: width);
  static List<BoxShadow> defaultBoxShadow({
    double y = 0,
    double x = 0,
    Color color = Colors.black12,
    double blur = 12,
  }) =>
      [
        BoxShadow(
          offset: Offset(y, x),
          color: color,
          blurRadius: blur,
        ),
      ];
  static showDefaultLoad<T>() => Get.dialog(
        CaupeLoading(),
        barrierColor: Colors.white.withOpacity(0.6),
        useSafeArea: false,
        barrierDismissible: false,
      );

  static void close<T>() => Get.back();

  static showDeleteBottomSheet(BuildContext context,
          {required VoidCallback action}) =>
      showAdaptiveActionSheet(
        context: context,
        title: Text('Are you sure you want to delete?'),
        actions: <BottomSheetAction>[
          BottomSheetAction(
              title: Text(
                'Yes',
                style: AppTypography.t16(),
              ),
              onPressed: () {
                action.call();
                Get.back();
              }),
          BottomSheetAction(
            title: Text(
              'No',
              style: AppTypography.t16().copyWith(
                color: Colors.red[400],
              ),
            ),
            onPressed: Get.back,
          ),
        ],
      );
  static showSnackBarError({required String message, required String title}) =>
      Get.snackbar(
        title,
        message,
        colorText: Colors.white,
        backgroundColor: Color(0xFF7A0000).withOpacity(0.6),
        backgroundGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xFF7A0000),
            Color(0xFFA60303).withOpacity(0.0),
          ],
        ),
      );

  static showSnackBarSuccess(
          {required String message, required String title}) =>
      Get.snackbar(
        title,
        message,
        colorText: Colors.white,
        backgroundColor: Color(0xFF007A55).withOpacity(0.6),
        backgroundGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xFF007A4B),
            Color(0xFF03A69E).withOpacity(0.0),
          ],
        ),
      );
}

extension AppDefaultPadding on Widget {
  Padding withAllPadding({double padding = AppDefault.vPadding}) => Padding(
        padding: EdgeInsets.all(padding),
        child: this,
      );

  Padding withSymPadding({
    double hPadding = AppDefault.hPadding,
    double vPadding = AppDefault.vPadding,
  }) =>
      Padding(
        padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: vPadding),
        child: this,
      );
  Padding withLeftPadding({double leftPadding = AppDefault.hPadding}) =>
      Padding(padding: EdgeInsets.only(left: leftPadding), child: this);

  Padding withRightPadding({double rightPadding = AppDefault.hPadding}) =>
      Padding(padding: EdgeInsets.only(right: rightPadding), child: this);

  Padding withTopPadding({double topPadding = AppDefault.vPadding}) =>
      Padding(padding: EdgeInsets.only(top: topPadding), child: this);

  Padding withBottomPadding({double bottomPadding = AppDefault.vPadding}) =>
      Padding(padding: EdgeInsets.only(bottom: bottomPadding), child: this);
}
