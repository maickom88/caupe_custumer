import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/theme.dart';
import '../../../components/components.dart';

class EditDescriptionBottomSheet extends StatefulWidget {
  final String? value;
  final ScrollController scrollController;
  final Function(String) onValue;
  const EditDescriptionBottomSheet({
    Key? key,
    required this.value,
    required this.scrollController,
    required this.onValue,
  }) : super(key: key);

  @override
  _EditDescriptionBottomSheetState createState() =>
      _EditDescriptionBottomSheetState();
}

class _EditDescriptionBottomSheetState
    extends State<EditDescriptionBottomSheet> {
  late TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController(text: widget.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                maxLength: 250,
                maxLines: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: AppDefault.defaultBorderRadius(radius: 10),
                  ),
                ),
              ).withBottomPadding(),
              CaupeButtonAdd(
                onTap: () {
                  if (controller.text != '') {
                    widget.onValue(controller.text);
                  }
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
