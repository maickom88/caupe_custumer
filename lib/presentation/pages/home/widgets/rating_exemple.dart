import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';

class RatingExemple extends StatelessWidget {
  final String quantStar;
  final double percent;
  final String value;
  final Color color;
  const RatingExemple({
    Key? key,
    required this.quantStar,
    required this.percent,
    required this.value,
    this.color = const Color(0xffFE6E63),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text.rich(
          TextSpan(children: [
            TextSpan(text: quantStar),
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: Icon(
                Icons.star,
                size: 17,
                color: Colors.grey[400],
              ),
            ),
          ]),
          textAlign: TextAlign.left,
          overflow: TextOverflow.ellipsis,
          style: AppTypography.t16().copyWith(
            color: Colors.grey[400],
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Color(0xffFEFEFEF),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Align(
                alignment: Alignment.centerLeft,
                child: FractionallySizedBox(
                  widthFactor: percent,
                  child: Container(
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            value,
            textAlign: TextAlign.right,
            overflow: TextOverflow.ellipsis,
            style: AppTypography.t16().copyWith(
              color: Colors.grey[400],
            ),
          ),
        ),
      ],
    ).withBottomPadding();
  }
}
