import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';
import '../../../components/components.dart';
import '../widgets/widgets.dart';

class ReviewsNav extends StatelessWidget {
  const ReviewsNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppDefault.defaultBorderRadiusOnly(),
      child: ListView(
        clipBehavior: Clip.none,
        children: [
          CaupeTitleWidget(
            title: 'Ratings',
          ).withBottomPadding(),
          ExempleRating().withAllPadding(),
          AppDefault.defaultSpaceHeight(),
          CaupeTitleWidget(
            title: 'Qualified / Unqualified',
          ).withBottomPadding(),
          QualifiedCard(
            description:
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard.dummy text ever since the 1500s',
            image: AppImages.badCompleteScore,
            value: '3.5',
            title: 'Punctuality',
          ).withBottomPadding(bottomPadding: 20),
          QualifiedCard(
            description:
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard.dummy text ever since the 1500s',
            image: AppImages.mediumCompleteScore,
            value: '3.5',
            title: 'Politeness',
          ).withBottomPadding(bottomPadding: 20),
          QualifiedCard(
            description:
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard.dummy text ever since the 1500s',
            image: AppImages.goodCompleteScore,
            value: '3.5',
            title: 'Punctuality',
          ).withBottomPadding(bottomPadding: 20),
          AppDefault.defaultSpaceHeight(),
          CaupeTitleWidget(
            title: 'Achievements',
          ).withBottomPadding(),
          CarouselSlider.builder(
            options: buildCarouselOptions(),
            itemCount: 3,
            itemBuilder: (_, index, dot) => Archievements(),
          ),
          SizedBox(height: 30)
        ],
      ).withTopPadding(topPadding: 10).withSymPadding(),
    );
  }
}

CarouselOptions buildCarouselOptions() {
  return CarouselOptions(
    enlargeCenterPage: true,
    height: 350,
    enlargeStrategy: CenterPageEnlargeStrategy.scale,
    aspectRatio: 2.0,
    viewportFraction: 0.8,
    initialPage: 2,
  );
}
