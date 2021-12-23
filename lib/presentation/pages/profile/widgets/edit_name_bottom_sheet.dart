import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_default.dart';
import '../../../components/components.dart';

class EditNameBottomSheet extends StatefulWidget {
  final String value;
  final Function(String value) onValue;
  final ScrollController scrollController;
  const EditNameBottomSheet({
    Key? key,
    required this.value,
    required this.onValue,
    required this.scrollController,
  }) : super(key: key);

  @override
  _EditNameBottomSheetState createState() => _EditNameBottomSheetState();
}

class _EditNameBottomSheetState extends State<EditNameBottomSheet> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: widget.value);
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
              TextFormField(
                controller: controller,
              ).withBottomPadding(),
              CaupeButtonAdd(
                onTap: () {
                  if (controller.text != '') {
                    widget.onValue(controller.text);
                  }
                  Get.back();
                },
                title: 'Save',
                tooltip: 'Salvar nome',
              )
            ],
          ),
        ),
      ),
    );
  }
}
