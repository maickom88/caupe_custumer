import 'package:flutter/material.dart';

import '../../core/theme/theme.dart';
import '../../core/extensions/extensions.dart';

class SumaryTile extends StatelessWidget {
  final String title;
  final String value;
  final String? document;
  const SumaryTile({
    Key? key,
    this.document,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypography.t18(),
        ),
        Text(
          value,
          style: AppTypography.t22WithW800(),
        ),
        Visibility(
          visible: document != null,
          child: Text(
            document?.lockDocument() ?? '',
            style: AppTypography.t14(),
          ),
        ),
      ],
    );
  }
}
