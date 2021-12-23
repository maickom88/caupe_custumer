import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/theme/theme.dart';

class CaupeButtonAdd extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String tooltip;
  const CaupeButtonAdd({
    Key? key,
    required this.onTap,
    this.title = 'Add more',
    this.tooltip = 'Adicionar dias',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onLongPress: () => HapticFeedback.vibrate(),
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0.0),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: AppDefault.defaultBorderRadius(radius: 10),
              side: BorderSide(
                color: Colors.blue,
                width: 2,
              ),
            ),
          ),
        ),
        onPressed: onTap,
        child: Tooltip(
          message: tooltip,
          child: Text(
            title,
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
