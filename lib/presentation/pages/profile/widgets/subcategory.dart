import 'package:brasil_fields/brasil_fields.dart';
import 'package:caupe_custumer/domain/entities/service_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';

import '../../../../core/theme/theme.dart';
import '../../../../data/models/models.dart';

class SubCategory extends StatefulWidget {
  final Function(SubCategoryModel?) onCategory;
  final String guid;
  final String title;
  final List<PriceEntity>? prices;
  const SubCategory({
    Key? key,
    this.prices,
    required this.guid,
    required this.onCategory,
    required this.title,
  }) : super(key: key);

  @override
  _SubCagtegoryState createState() => _SubCagtegoryState();
}

class _SubCagtegoryState extends State<SubCategory> {
  late bool isOpenCategory;
  late TextEditingController priceController;
  late TextEditingController hoursController;
  DateTime? dateTime;

  @override
  void initState() {
    isOpenCategory = false;
    double? price;
    DateTime? hours;
    final prices = widget.prices
        ?.where((element) => element.subCategory?.guid == widget.guid)
        .toList();
    if (prices != null) {
      if (prices.isNotEmpty) {
        price = prices.first.price;
        hours = prices.first.hours;
        widget.onCategory(SubCategoryModel(
          hours: prices.first.hours,
          price: price,
          guid: widget.guid,
          title: widget.title,
        ));
      }
    } else {
      widget.onCategory(null);
    }
    priceController = TextEditingController(text: price?.toString());
    hoursController = TextEditingController(
      text: hours != null
          ? '${hours.hour.toString().padLeft(2, '0')} hours ${hours.minute} min'
          : null,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      maintainState: true,
      onExpansionChanged: (isOpen) {
        setState(() {
          isOpenCategory = isOpen;
        });
      },
      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: AppDefault.defaultBorderRadius(radius: 5),
          color: Theme.of(context)
              .primaryColor
              .withOpacity(isOpenCategory ? 0.4 : 1),
        ),
        child: isOpenCategory
            ? Icon(
                Icons.minimize,
                color: Colors.white,
                size: 22,
              )
            : Icon(Icons.add, color: Colors.white, size: 22),
      ),
      title: Text(widget.title),
      trailing: SizedBox(),
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  widget.onCategory(
                    SubCategoryModel(
                      guid: widget.guid,
                      hours: dateTime,
                      price: double.tryParse(priceController.text),
                      title: widget.title,
                    ),
                  );
                },
                controller: priceController,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  RealInputFormatter(),
                ],
                decoration: InputDecoration(
                  prefix: Text("\$"),
                  hintText: '00',
                  border: OutlineInputBorder(
                    borderRadius: AppDefault.defaultBorderRadius(radius: 5),
                  ),
                ),
              ).withRightPadding(),
            ),
            Expanded(
              child: TextFormField(
                readOnly: true,
                controller: hoursController,
                onTap: () {
                  DatePicker.showDatePicker(
                    context,
                    minDateTime: DateTime.parse('2021-30-12 00:00:00'),
                    maxDateTime: DateTime.parse('2025-30-12 23:59:00'),
                    initialDateTime: DateTime.now(),
                    dateFormat: 'HH:mm',
                    pickerMode: DateTimePickerMode.time, // show TimePicker
                    pickerTheme: DateTimePickerTheme(
                      confirm: Container(
                        child: Text(
                          'Confirmar',
                          style: TextStyle(
                            color: Colors.green[300],
                          ),
                        ),
                      ),
                      cancel: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.red[300],
                        ),
                      ),
                      titleHeight: 56.0,
                    ),
                    onCancel: () {
                      debugPrint('onCancel');
                    },
                    onConfirm: (dateTimeConfirm, List<int> index) {
                      setState(() {
                        hoursController.text =
                            '${dateTimeConfirm.hour.toString().padLeft(2, '0')} hours ${dateTimeConfirm.minute} min';
                        dateTime = dateTimeConfirm;
                      });
                      widget.onCategory(
                        SubCategoryModel(
                          hours: dateTime,
                          guid: widget.guid,
                          price: double.tryParse(priceController.text),
                          title: widget.title,
                        ),
                      );
                    },
                  );
                },
                decoration: InputDecoration(
                  hintText: 'Hours',
                  border: OutlineInputBorder(
                    borderRadius: AppDefault.defaultBorderRadius(radius: 5),
                  ),
                ),
              ),
            ),
          ],
        ).withBottomPadding(),
      ],
    );
  }
}
