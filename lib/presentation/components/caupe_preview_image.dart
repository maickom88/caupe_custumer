import 'dart:ui';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/app_default.dart';

class CaupePreviewImage extends StatelessWidget {
  final String image;
  const CaupePreviewImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: EdgeInsets.symmetric(horizontal: 13),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 4, sigmaX: 5),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
            borderRadius: AppDefault.defaultBorderRadius(),
            color: Colors.white,
            boxShadow: AppDefault.defaultBoxShadow(),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Material(
                  child: IconButton(
                    onPressed: Get.back,
                    icon: Icon(Icons.close),
                  ),
                ),
              ),
              Container(
                constraints: BoxConstraints(maxHeight: 350),
                child: ClipRRect(
                  borderRadius: AppDefault.defaultBorderRadius(),
                  child: ExtendedImage.network(
                    image,
                    fit: BoxFit.cover,
                    timeLimit: Duration(days: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
