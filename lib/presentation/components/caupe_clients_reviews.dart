import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/theme.dart';
import 'components.dart';

class CaupeClientsReviews extends StatelessWidget {
  const CaupeClientsReviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 5),
      child: Container(
        width: Get.width.percent(86),
        padding:
            EdgeInsets.symmetric(vertical: 15, horizontal: AppDefault.hPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: AppDefault.defaultBorderRadius(),
          boxShadow: AppDefault.defaultBoxShadow(),
        ),
        child: Row(
          children: [
            Container(
              width: 90,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: AppDefault.defaultBorderRadius(),
                color: Colors.grey[200],
              ),
              child: ClipRRect(
                borderRadius: AppDefault.defaultBorderRadius(),
                child: ExtendedImage.network(
                  'https://images.pexels.com/photos/697509/pexels-photo-697509.jpeg?cs=srgb&dl=pexels-andrew-dick-697509.jpg&fm=jpg',
                  cache: true,
                  timeLimit: Duration(days: 1),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            AppDefault.defaultSpaceWidth(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                                  color:
                                      Theme.of(context).secondaryHeaderColor),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Flexible(
                    child: CaupeTextMoreLess(
                      onTap: () => Get.dialog(
                        CaupePreviewReview(
                          image:
                              'https://images.pexels.com/photos/697509/pexels-photo-697509.jpeg?cs=srgb&dl=pexels-andrew-dick-697509.jpg&fm=jpg',
                          review:
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
                          stars: 4.5,
                          title: 'Manicure',
                        ),
                        barrierColor: Colors.white.withOpacity(0.6),
                      ),
                      text:
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
