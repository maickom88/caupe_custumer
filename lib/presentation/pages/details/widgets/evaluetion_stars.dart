import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';

class EvaluetionStars extends StatefulWidget {
  final Function(int) onValue;
  const EvaluetionStars({
    Key? key,
    required this.onValue,
  }) : super(key: key);

  @override
  _EvaluetionStarsState createState() => _EvaluetionStarsState();
}

class _EvaluetionStarsState extends State<EvaluetionStars> {
  late int index;

  @override
  void initState() {
    index = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      clipBehavior: Clip.none,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppDefault.vPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [1, 2, 3, 4, 5]
              .map(
                (e) => IconButton(
                  onPressed: () {
                    setState(() {
                      index = e;
                    });
                    widget.onValue(e);
                  },
                  tooltip: '1',
                  iconSize: 40,
                  color: e > 0 && e <= index ? Colors.yellow : Colors.grey[400],
                  icon: Icon(Icons.star),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
