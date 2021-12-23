import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/enums/enums.dart';
import '../../../../core/theme/theme.dart';

class DaysAvailable extends StatelessWidget {
  final TypeDay typeDay;
  final VoidCallback onTap;
  final bool isActive;
  const DaysAvailable({
    Key? key,
    required this.typeDay,
    required this.onTap,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: AppDefault.defaultBorderRadius(radius: 5),
      onTap: onTap,
      onLongPress: () => HapticFeedback.vibrate(),
      child: Tooltip(
        message: typeDay.dayInString(),
        child: AnimatedContainer(
          padding: EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            borderRadius: AppDefault.defaultBorderRadius(radius: 5),
            color: isActive
                ? Colors.white.withOpacity(1)
                : Colors.white.withOpacity(0.0),
          ),
          duration: Duration(milliseconds: 250),
          curve: Curves.easeInCubic,
          child: Text(
            typeDay.dayInStringAbbreviated(),
            style: AppTypography.t14().copyWith(
              color: isActive ? Colors.black87 : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
