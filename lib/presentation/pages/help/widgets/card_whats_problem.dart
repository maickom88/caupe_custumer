import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';
import 'widgets.dart';

class CardWhatsProblem extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;
  const CardWhatsProblem({
    Key? key,
    required this.onTap,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 0,
      child: InkWell(
        onTap: () {
          showFlexibleBottomSheet(
            minHeight: 200,
            initHeight: 0.5,
            maxHeight: 0.95,
            context: context,
            builder: (
              context,
              scrollController,
              bottomSheetOffset,
            ) {
              return ReportService(
                scrollController: scrollController,
                onSend: () => onTap,
              );
            },
            anchors: [0, 0.5, 1],
          );
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: AppDefault.defaultBoxShadow(),
            color: Colors.white.withOpacity(0.9),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.help_center_rounded,
                  color: Colors.grey,
                  size: 28,
                ).withBottomPadding(),
                Text(
                  title,
                  style: AppTypography.t16WithW800(),
                ).withBottomPadding(),
                Text(
                  description,
                  style: AppTypography.t14().copyWith(color: Colors.grey),
                )
              ],
            ),
          ),
        ),
      ).withAllPadding(),
    );
  }
}
