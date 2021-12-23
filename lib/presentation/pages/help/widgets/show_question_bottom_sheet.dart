import 'package:caupe_custumer/core/enums/enums.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:caupe_custumer/domain/entities/helps_entity.dart';

import '../../../../core/theme/theme.dart';
import '../../../components/components.dart';
import 'widgets.dart';

class ShowQuestion extends StatefulWidget {
  final HelpsEntity help;
  final ScrollController scrollController;
  final Function(HelpsEntity e, bool isGood) onUpdate;
  const ShowQuestion({
    Key? key,
    required this.help,
    required this.onUpdate,
    required this.scrollController,
  }) : super(key: key);

  @override
  _ShowQuestionState createState() => _ShowQuestionState();
}

class _ShowQuestionState extends State<ShowQuestion> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: 20, horizontal: AppDefault.hPadding),
          decoration: const BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            controller: widget.scrollController,
            children: [
              Center(
                child: Container(
                  width: 120,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey[300],
                  ),
                ),
              ),
              AppDefault.defaultSpaceHeight(),
              CaupeTitleWidget(title: widget.help.title).withBottomPadding(),
              Text(widget.help.description),
              AppDefault.defaultSpaceHeight(),
              Center(
                child: Text('This information is good?'),
              ).withBottomPadding(),
              EvaluetionInformation(
                onEvaluetion: (value) => widget.onUpdate(
                    widget.help, value == TypeEvaluetionInformation.good),
                evaluetion: widget.help.evaluation?.isGood == null
                    ? null
                    : widget.help.evaluation?.isGood == true
                        ? TypeEvaluetionInformation.good
                        : TypeEvaluetionInformation.bad,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
