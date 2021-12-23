import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';

class SocialProvider extends StatelessWidget {
  final String providerName;
  final String providerPhoto;
  final VoidCallback onTap;
  const SocialProvider({
    Key? key,
    required this.providerName,
    required this.providerPhoto,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: AppDefault.defaultBorderRadius(),
      color: Colors.transparent,
      child: InkWell(
        borderRadius: AppDefault.defaultBorderRadius(),
        onTap: onTap,
        child: Column(
          children: [
            Image.asset(
              providerPhoto,
              height: 70,
            ).withSymPadding(),
            Text(providerName),
          ],
        ),
      ),
    );
  }
}
