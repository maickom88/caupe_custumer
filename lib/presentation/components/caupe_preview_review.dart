import 'dart:ui';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/theme.dart';

class CaupePreviewReview extends StatelessWidget {
  final String image;
  final String review;
  final String title;
  final double stars;
  const CaupePreviewReview({
    Key? key,
    required this.image,
    required this.review,
    required this.title,
    required this.stars,
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
          child: SingleChildScrollView(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 90,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: AppDefault.defaultBorderRadius(),
                        color: Colors.green,
                      ),
                      child: ClipRRect(
                        borderRadius: AppDefault.defaultBorderRadius(),
                        child: ExtendedImage.network(
                          image,
                          cache: true,
                          timeLimit: Duration(days: 1),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    AppDefault.defaultSpaceWidth(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Manicure',
                          overflow: TextOverflow.ellipsis,
                          style: AppTypography.t16WithW800(),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Theme.of(context).secondaryHeaderColor,
                              ),
                              Text(
                                '4.5',
                                style: AppTypography.t16WithW800().copyWith(
                                  fontSize: 45,
                                  color: Theme.of(context).secondaryHeaderColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                AppDefault.defaultSpaceHeight(),
                Text(review)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
