import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:get/get.dart';
import 'package:google_maps_webservice/places.dart';

import '../../../../core/theme/theme.dart';
import '../../../components/components.dart';

class EditAddressBottomSheet extends StatefulWidget {
  final String? value;
  final Function(String) onValue;
  final ScrollController scrollController;

  const EditAddressBottomSheet({
    Key? key,
    required this.value,
    required this.onValue,
    required this.scrollController,
  }) : super(key: key);

  @override
  _EditAddressBottomSheetState createState() => _EditAddressBottomSheetState();
}

class _EditAddressBottomSheetState extends State<EditAddressBottomSheet> {
  late TextEditingController inputController;
  @override
  void initState() {
    inputController = TextEditingController();
    if (widget.value != null) {
      inputController.text = widget.value!;
    } else {
      inputController.text = 'Write your city';
    }
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
                controller: inputController,
                maxLines: 2,
                readOnly: true,
                onTap: () async {
                  final prediction = await PlacesAutocomplete.show(
                      context: context,
                      offset: 0,
                      radius: 1000,
                      types: [],
                      strictbounds: false,
                      region: "br",
                      apiKey: 'AIzaSyB4YNXtC1-hQa7JeU-kATCwgXSlYXxif4U',
                      mode: Mode.fullscreen, // Mode.fullscreen
                      language: "pt",
                      components: [
                        new Component(Component.country, "br"),
                      ]);
                  setState(() {
                    if (prediction != null) {
                      if (prediction.description != null)
                        inputController.text = prediction.description!;
                    }
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: AppDefault.defaultBorderRadius(radius: 10),
                  ),
                ),
              ).withBottomPadding().withBottomPadding(),
              CaupeButtonAdd(
                onTap: () {
                  if (inputController.text != '' &&
                      inputController.text != 'Write your city') {
                    widget.onValue(inputController.text);
                  }
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
