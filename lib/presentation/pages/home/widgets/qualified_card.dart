import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';

class QualifiedCard extends StatelessWidget {
  final String title;
  final String description;
  final String value;
  final String image;
  const QualifiedCard({
    Key? key,
    required this.title,
    required this.description,
    required this.value,
    required this.image,
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
      child: Row(
        children: [
          Expanded(
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: AppTypography.t28WithW800().copyWith(
                          color: Theme.of(context).secondaryHeaderColor)),
                  Flexible(
                    child: Text(description),
                  )
                ],
              ),
            ),
          ),
          AppDefault.defaultSpaceWidth(),
          Column(
            children: [
              Image.asset(image, height: 120),
              Text(
                '3.5',
                style: AppTypography.t16WithW800().copyWith(
                  color: Colors.yellow[700],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
