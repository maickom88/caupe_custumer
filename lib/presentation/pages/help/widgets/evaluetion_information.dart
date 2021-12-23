import 'package:flutter/material.dart';

import '../../../../core/enums/enums.dart';

class EvaluetionInformation extends StatefulWidget {
  final Function(TypeEvaluetionInformation?) onEvaluetion;
  final TypeEvaluetionInformation? evaluetion;
  const EvaluetionInformation({
    Key? key,
    required this.onEvaluetion,
    this.evaluetion,
  }) : super(key: key);

  @override
  _EvaluetionInformationState createState() => _EvaluetionInformationState();
}

class _EvaluetionInformationState extends State<EvaluetionInformation> {
  TypeEvaluetionInformation? evaluetion;

  @override
  void initState() {
    evaluetion = widget.evaluetion;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              evaluetion = TypeEvaluetionInformation.bad;
              widget.onEvaluetion(evaluetion);
            });
          },
          child: AnimatedContainer(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              border: Border.all(
                color: evaluetion == TypeEvaluetionInformation.bad
                    ? Colors.purple
                    : Colors.grey.withOpacity(0.4),
              ),
              shape: BoxShape.circle,
              color: evaluetion == TypeEvaluetionInformation.bad
                  ? Theme.of(context).primaryColor
                  : Colors.grey[300],
            ),
            duration: Duration(milliseconds: 250),
            curve: Curves.easeInBack,
            child: Icon(
              Icons.thumb_down,
              color: evaluetion == TypeEvaluetionInformation.bad
                  ? Colors.white
                  : Colors.grey,
            ),
          ),
        ),
        SizedBox(width: 20),
        InkWell(
          onTap: () {
            setState(() {
              evaluetion = TypeEvaluetionInformation.good;
              widget.onEvaluetion(evaluetion);
            });
          },
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              border: Border.all(
                color: evaluetion == TypeEvaluetionInformation.good
                    ? Colors.purple
                    : Colors.grey.withOpacity(0.4),
              ),
              shape: BoxShape.circle,
              color: evaluetion == TypeEvaluetionInformation.good
                  ? Theme.of(context).primaryColor
                  : Colors.grey[300],
            ),
            child: Icon(
              Icons.thumb_up,
              color: evaluetion == TypeEvaluetionInformation.good
                  ? Colors.white
                  : Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
