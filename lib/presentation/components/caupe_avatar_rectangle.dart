import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/theme.dart';
import 'components.dart';

class CaupeAvatarRectangle extends StatelessWidget {
  final double width;
  final String image;
  const CaupeAvatarRectangle({
    Key? key,
    this.width = 80,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width,
      padding: EdgeInsets.symmetric(
          vertical: AppDefault.vPadding, horizontal: AppDefault.hPadding),
      decoration: BoxDecoration(
        borderRadius: AppDefault.defaultBorderRadius(radius: 10),
      ),
      child: InkWell(
        onTap: () => Get.dialog(CaupePreviewImage(image: image)),
        child: ClipRRect(
          borderRadius: AppDefault.defaultBorderRadius(radius: 10),
          child: ExtendedImage.network(
            image,
            cache: true,
            fit: BoxFit.cover,
            timeLimit: Duration(days: 1),
          ),
        ),
      ),
    );
  }
}
