import 'package:flutter/material.dart';

import '../../core/theme/theme.dart';
import 'caupe_sumary_title.dart';

class CaupeSummary extends StatelessWidget {
  final String? document;
  final String meta;
  final String total;
  const CaupeSummary({
    Key? key,
    this.document,
    required this.meta,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppDefault.hPadding,
        vertical: 30,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppDefault.defaultBorderRadius(),
        boxShadow: AppDefault.defaultBoxShadow(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SumaryTile(
              title: 'Total Balance',
              value: total,
              document: document,
            ),
          ),
          AppDefault.defaultSpaceWidth(width: 20),
          Image.asset(
            AppImages.mediumScore,
            height: 60,
          ),
          AppDefault.defaultSpaceWidth(width: 20),
          Expanded(
            child: SumaryTile(
              title: 'Meta',
              value: meta,
            ),
          ),
        ],
      ),
    );
  }
}
