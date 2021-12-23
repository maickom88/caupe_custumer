import 'package:flutter/material.dart';

import '../../../../core/enums/enums.dart';
import '../../../../core/theme/theme.dart';
import 'widgets.dart';

class OnLoginSocial extends StatelessWidget {
  final Function(TypeProviderSocial) onProvider;
  const OnLoginSocial({
    Key? key,
    required this.onProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SocialProvider(
          providerPhoto: AppImages.google,
          providerName: 'Google',
          onTap: () => onProvider(TypeProviderSocial.google),
        ),
        SocialProvider(
          providerPhoto: AppImages.facebook,
          providerName: 'Facebook',
          onTap: () => onProvider(TypeProviderSocial.facebook),
        ),
        SocialProvider(
          providerPhoto: AppImages.apple,
          providerName: 'Apple',
          onTap: () => onProvider(TypeProviderSocial.apple),
        ),
      ],
    );
  }
}
