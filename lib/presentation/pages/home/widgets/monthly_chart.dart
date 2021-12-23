import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';

class MonthlyChart extends StatelessWidget {
  final String month;
  final double percent;
  final String value;
  const MonthlyChart({
    Key? key,
    required this.month,
    required this.percent,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            month,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            style: AppTypography.t16(),
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
                      color: Color(0xffFE6E63),
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
            style: AppTypography.t16(),
          ),
        ),
      ],
    ).withBottomPadding();
  }
}

class DailyChart extends StatelessWidget {
  const DailyChart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: AppDefault.defaultBoxShadow(),
        borderRadius: AppDefault.defaultBorderRadius(),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Start Date',
                style: AppTypography.t16WithW800(),
              ),
              AppDefault.defaultSpaceHeight(),
              Text(
                '24 Oct, 2020',
                style: AppTypography.t16(),
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Material(
              color: Colors.transparent,
              child: IconButton(
                icon: Icon(Icons.change_circle),
                onPressed: () {},
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Start Date',
                style: AppTypography.t16WithW800(),
              ),
              AppDefault.defaultSpaceHeight(),
              Text(
                '24 Oct, 2020',
                style: AppTypography.t16(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
