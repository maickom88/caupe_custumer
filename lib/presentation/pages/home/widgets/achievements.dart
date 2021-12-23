import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';

class Archievements extends StatelessWidget {
  const Archievements({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding:
          EdgeInsets.symmetric(vertical: 20, horizontal: AppDefault.hPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: AppDefault.defaultBoxShadow(),
        borderRadius: AppDefault.defaultBorderRadius(),
      ),
      child: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppIcons.trophy, height: 100),
            AppDefault.defaultSpaceHeight(),
            Text(
              'Lorem Ipsum is simply dummy text of the printing and industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s',
              textAlign: TextAlign.center,
              style: AppTypography.t16(),
            ),
            AppDefault.defaultSpaceHeight(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Read More'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
