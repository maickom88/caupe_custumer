import '../../../../core/constants/routes_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/theme.dart';

class RegisterAction extends StatelessWidget {
  const RegisterAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: 'Don\'t have an accout?'),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: TextButton(
              child: Text('SIGN UP'),
              onPressed: () => Get.toNamed(RoutesConsts.register),
            ).withLeftPadding(leftPadding: 5),
          )
        ],
      ),
    ).withSymPadding(vPadding: 20);
  }
}
