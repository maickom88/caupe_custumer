import 'package:flutter/material.dart';

import '../../core/theme/theme.dart';

class CaupeHeader extends StatelessWidget {
  final double heightImage;
  const CaupeHeader({
    Key? key,
    this.heightImage = 80,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.logo,
      height: heightImage,
      fit: BoxFit.contain,
    );
  }
}
