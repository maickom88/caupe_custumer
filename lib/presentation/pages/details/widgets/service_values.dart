import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';

class ServiceValues extends StatelessWidget {
  final String service;
  final double price;
  const ServiceValues({
    Key? key,
    required this.service,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          service,
          style: AppTypography.t16(),
        ),
        Text(
          '\$$price',
          style: AppTypography.t16WithW800().copyWith(
            color: Colors.green[400],
          ),
        ),
      ],
    );
  }
}
