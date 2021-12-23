import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

import '../../core/theme/theme.dart';

class NumberCodeConfirmation extends StatefulWidget {
  final Function(String otp) onCode;
  const NumberCodeConfirmation({
    Key? key,
    required this.onCode,
  }) : super(key: key);

  @override
  _NumberCodeConfirmationState createState() => _NumberCodeConfirmationState();
}

class _NumberCodeConfirmationState extends State<NumberCodeConfirmation> {
  late Timer timer;
  late Duration duration;
  late int endTime;
  @override
  void initState() {
    endTime = 59;
    duration = Duration(seconds: 1);
    startTimer();
    super.initState();
  }

  void startTimer() {
    timer = new Timer.periodic(
      duration,
      (t) {
        if (endTime == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            endTime--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _pinPutFocusNode = FocusNode();
    final _code = TextEditingController();
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: AppDefault.hPadding, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: AppDefault.defaultBorderRadius(),
            boxShadow: AppDefault.defaultBoxShadow(),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'CONFIRM SEND CODE',
                style: AppTypography.t16WithW800(),
              ),
              Text(
                'Wait for a few minutes',
                style: AppTypography.t14().copyWith(color: Colors.grey),
              ).withBottomPadding(bottomPadding: 20),
              PinPut(
                controller: _code,
                fieldsCount: 6,
                autofocus: true,
                onSubmit: (String otp) => widget.onCode(otp),
                focusNode: _pinPutFocusNode,
                submittedFieldDecoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                selectedFieldDecoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                followingFieldDecoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ).withBottomPadding(bottomPadding: 20),
              Visibility(
                visible: endTime > 0,
                child: Text(
                  'Wait ${endTime}s to send again!',
                  style: AppTypography.t14().copyWith(color: Colors.grey),
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Code is not show?'),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: TextButton(
                        onPressed: endTime == 0
                            ? () {
                                setState(() {
                                  endTime = 59;
                                  startTimer();
                                });
                              }
                            : null,
                        child: Text('Send again'),
                      ).withLeftPadding(),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
