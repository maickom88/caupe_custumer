import 'package:flutter/material.dart';

import '../../../../core/enums/enums.dart';
import '../../../../core/theme/theme.dart';
import 'widgets.dart';

class AvailableDaysList extends StatelessWidget {
  final Function(TypeDay) onDay;
  final List<TypeDay> selectDays;
  const AvailableDaysList({
    Key? key,
    required this.onDay,
    required this.selectDays,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      padding:
          EdgeInsets.symmetric(vertical: 0, horizontal: AppDefault.hPadding),
      decoration: BoxDecoration(
        borderRadius: AppDefault.defaultBorderRadius(),
        color: Color(0xff303030),
      ),
      child: Material(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: TypeDay.values
              .map(
                (day) => DaysAvailable(
                  typeDay: day,
                  isActive: selectDays.contains(day),
                  onTap: () => onDay(day),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
