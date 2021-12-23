import 'package:flutter/material.dart';

import '../../core/theme/theme.dart';

class CaupeTitleWidget extends StatelessWidget {
  final String title;
  const CaupeTitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTypography.t18WithW800(),
    );
  }
}
