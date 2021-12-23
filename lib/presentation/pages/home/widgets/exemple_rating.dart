import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';
import 'widgets.dart';

class ExempleRating extends StatelessWidget {
  const ExempleRating({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: AppDefault.hPadding,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppDefault.defaultBorderRadius(),
        boxShadow: AppDefault.defaultBoxShadow(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            AppImages.exemple,
            fit: BoxFit.cover,
          ),
          AppDefault.defaultSpaceHeight(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TotalRating(),
              ListRating(),
            ],
          )
        ],
      ),
    );
  }
}

class TotalRating extends StatelessWidget {
  const TotalRating({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '3.5',
            style: AppTypography.t28WithW800(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                color: Colors.grey[400],
                size: 18,
              ),
              Icon(
                Icons.star,
                color: Colors.grey[400],
                size: 18,
              ),
              Icon(
                Icons.star,
                color: Colors.grey[400],
                size: 18,
              ),
              Icon(
                Icons.star,
                color: Colors.grey[400],
                size: 18,
              ),
              Icon(
                Icons.star,
                color: Colors.grey[400],
                size: 18,
              ),
            ],
          ),
          AppDefault.defaultSpaceHeight(height: 5),
          Text.rich(
            TextSpan(
              children: [
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Icon(
                    Icons.person,
                    size: 26,
                  ),
                ),
                TextSpan(text: ' 2 Total', style: AppTypography.t16WithW800())
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ListRating extends StatelessWidget {
  const ListRating({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          RatingExemple(
            quantStar: '1',
            percent: 0.6,
            value: '1 (50%)',
            color: Color(0xff00B81E),
          ),
          RatingExemple(
            quantStar: '1',
            percent: 0.8,
            value: '1 (50%)',
            color: Color(0xff83C400),
          ),
          RatingExemple(
            quantStar: '1',
            percent: 0.5,
            value: '1 (50%)',
            color: Color(0xffFFEA00),
          ),
          RatingExemple(
            quantStar: '1',
            percent: 0.4,
            value: '1(50%)',
            color: Color(0xffFFB700),
          ),
          RatingExemple(
            quantStar: '1',
            percent: 0.7,
            value: '1(50%)',
          ),
        ],
      ),
    );
  }
}
