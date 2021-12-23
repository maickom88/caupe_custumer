import 'package:flutter/material.dart';

class RowDots extends StatelessWidget {
  final int index;
  final int length;
  const RowDots({
    Key? key,
    required this.index,
    required this.length,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (indexPage) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: indexPage != index ? Colors.grey[300] : Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}
