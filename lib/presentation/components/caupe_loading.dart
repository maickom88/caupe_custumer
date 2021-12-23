import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class CaupeLoading extends StatelessWidget {
  const CaupeLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
          child: Container(
            height: 50,
            child: Center(
              child: LoadingIndicator(
                indicatorType: Indicator.lineScale,
                color: Theme.of(context).secondaryHeaderColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
