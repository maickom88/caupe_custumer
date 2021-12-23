import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_default.dart';
import '../../../../core/theme/theme.dart';
import '../../../components/components.dart';
import 'widgets.dart';

class EvaluetionBottomSheet extends StatelessWidget {
  final ScrollController scrollController;
  final Function(int?) onEvaluetion;
  const EvaluetionBottomSheet({
    Key? key,
    required this.scrollController,
    required this.onEvaluetion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? evaluetionIndex;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Material(
        color: Colors.transparent,
        clipBehavior: Clip.none,
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
            clipBehavior: Clip.none,
            padding: EdgeInsets.zero,
            controller: scrollController,
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
              EvaluetionStars(
                onValue: (value) => evaluetionIndex = value,
              ),
              AppDefault.defaultSpaceHeight(),
              CaupeButtonAdd(
                onTap: () {
                  onEvaluetion(evaluetionIndex);
                  Get.back();
                },
                title: 'Save',
                tooltip: 'Salvar descrição',
              )
            ],
          ),
        ),
      ),
    );
  }
}
