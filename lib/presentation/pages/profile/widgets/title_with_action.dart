import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/theme/theme.dart';
import '../../../components/components.dart';

class TitleWithAction extends StatelessWidget {
  final String title;

  final VoidCallback onTap;
  const TitleWithAction({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CaupeTitleWidget(title: title),
        InkWell(
          onTap: onTap,
          borderRadius: AppDefault.defaultBorderRadius(radius: 10),
          onLongPress: () => HapticFeedback.vibrate(),
          child: Tooltip(
            message: 'Adicionar $title',
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: AppDefault.defaultBorderRadius(radius: 10),
                border: Border.all(
                  width: 1,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
              ),
              child: Icon(
                Icons.add,
                color: Theme.of(context).secondaryHeaderColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
