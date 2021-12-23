import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/routes_constants.dart';
import '../../../../core/theme/theme.dart';
import '../../../components/components.dart';

class CardCalender extends StatelessWidget {
  const CardCalender({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
            vertical: AppDefault.vPadding, horizontal: AppDefault.hPadding),
        decoration: BoxDecoration(
          borderRadius: AppDefault.defaultBorderRadius(),
          boxShadow: AppDefault.defaultBoxShadow(),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CaupeAvatarRectangle(
                  image:
                      'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?cs=srgb&dl=pexels-pixabay-220453.jpg&fm=jpg',
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Michael Joe',
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.t18WithW800().copyWith(
                          color: Colors.grey[800],
                        ),
                      ),
                      Text(
                        '29 Out 2021, 12:14',
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.t18().copyWith(
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Divider(color: Colors.grey),
            AppDefault.defaultSpaceHeight(),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Rua Amaro Cavalheiro - Pinheiros Sao Paulo - Sp',
                      textAlign: TextAlign.start,
                      style: AppTypography.t16().copyWith(color: Colors.grey),
                    ),
                  ),
                  VerticalDivider(color: Colors.grey),
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Icon(
                      Icons.location_on,
                      size: 30,
                      color: Color(0xff948CDE),
                    ),
                  ),
                ],
              ),
            ),
            AppDefault.defaultSpaceHeight(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.toNamed(RoutesConsts.details),
                child: Text('More details'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
