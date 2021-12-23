import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class CaupeHeaderAvatar extends StatelessWidget {
  final String url;
  final VoidCallback onTap;
  final double radius;
  const CaupeHeaderAvatar({
    Key? key,
    required this.url,
    required this.onTap,
    this.radius = 25,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, top: 0),
      child: InkWell(
        onTap: onTap,
        child: CircleAvatar(
          radius: radius,
          backgroundColor: Colors.grey[200],
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: ExtendedImage.network(
              url,
              width: double.infinity,
              cache: true,
              fit: BoxFit.cover,
              timeLimit: Duration(days: 15),
            ),
          ),
        ),
      ),
    );
  }
}
