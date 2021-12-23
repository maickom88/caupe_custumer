import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../core/theme/theme.dart';
import '../../../components/components.dart';

class EditPhoneBottomSheet extends StatefulWidget {
  final String? value;
  final ScrollController scrollController;
  final Function(String? phone) onTap;
  const EditPhoneBottomSheet({
    Key? key,
    required this.value,
    required this.scrollController,
    required this.onTap,
  }) : super(key: key);

  @override
  _EditPhoneBottomSheetState createState() => _EditPhoneBottomSheetState();
}

class _EditPhoneBottomSheetState extends State<EditPhoneBottomSheet> {
  late TextEditingController phoneController;

  @override
  void initState() {
    phoneController = TextEditingController(text: widget.value);
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
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: AppDefault.defaultBoxShadow(),
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
                controller: phoneController,
                keyboardType: TextInputType.number,
                autofocus: true,
                decoration: InputDecoration(
                  prefix: Text(
                    ' +55 ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  TelefoneInputFormatter(),
                ],
              ).withBottomPadding(),
              CaupeButtonAdd(
                onTap: () {
                  widget.onTap(phoneController.text);
                  Get.back();
                },
                title: 'Save',
                tooltip: 'Salvar endereço',
              )
            ],
          ),
        ),
      ),
    );
  }
}
