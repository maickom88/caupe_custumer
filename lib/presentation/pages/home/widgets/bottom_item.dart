import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/theme.dart';

class BottomItem extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final String icon;
  final bool isActive;

  const BottomItem({
    Key? key,
    required this.isActive,
    required this.onTap,
    required this.label,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        padding: EdgeInsets.symmetric(
            horizontal: 20 * 0.8, vertical: AppDefault.vPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: isActive
              ? Theme.of(context).secondaryHeaderColor
              : Colors.transparent,
        ),
        duration: Duration(milliseconds: 300),
        curve: Curves.elasticInOut,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Image.asset(
                icon,
                color: isActive
                    ? Colors.white
                    : Theme.of(context).secondaryHeaderColor,
                height: Get.height.percent(2.8),
              ),
              Visibility(
                visible: isActive,
                child: AppDefault.defaultSpaceWidth(),
              ),
              Visibility(
                visible: isActive,
                child: Text(
                  label,
                  style: AppTypography.t14().copyWith(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
