import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/theme/theme.dart';

class EditActionButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool onDisabled;
  const EditActionButton({
    Key? key,
    this.onDisabled = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onDisabled ? null : onTap,
      onLongPress: () => HapticFeedback.vibrate(),
      borderRadius: AppDefault.defaultBorderRadius(radius: 8),
      child: Tooltip(
        message: 'Editar informação',
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: AppDefault.hPadding,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: onDisabled
                  ? Colors.grey.withOpacity(0.2)
                  : Colors.grey.withOpacity(0.5),
            ),
            borderRadius: AppDefault.defaultBorderRadius(radius: 8),
          ),
          child: Text.rich(
            TextSpan(
                style: AppTypography.t14().copyWith(
                  color: onDisabled
                      ? Colors.grey.withOpacity(0.3)
                      : Colors.grey.withOpacity(0.6),
                ),
                children: [
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Icon(
                      Icons.edit,
                      color: onDisabled
                          ? Colors.grey.withOpacity(0.2)
                          : Colors.grey.withOpacity(0.5),
                      size: 18,
                    ),
                  ),
                  TextSpan(text: 'Edit'),
                ]),
          ),
        ),
      ),
    );
  }
}
