import 'package:brasil_fields/brasil_fields.dart';
import 'package:caupe_custumer/domain/entities/available_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../core/enums/enums.dart';
import '../../../../core/theme/theme.dart';
import '../../../../data/models/available_model.dart';
import '../../../components/components.dart';
import 'widgets.dart';

class AddHoursAvailable extends StatefulWidget {
  final ScrollController scrollController;
  final AvailableEntity? entity;
  final Function(AvailableModel available) onAvailable;

  const AddHoursAvailable({
    Key? key,
    this.entity,
    required this.onAvailable,
    required this.scrollController,
  }) : super(key: key);

  @override
  _AddHoursAvailableState createState() => _AddHoursAvailableState();
}

class _AddHoursAvailableState extends State<AddHoursAvailable> {
  late List<TypeDay> days;
  late String? guid;
  late TextEditingController firstHours, lastHours;
  @override
  void initState() {
    days = widget.entity != null ? widget.entity!.days : [];
    guid = widget.entity?.guid;
    firstHours = TextEditingController(text: widget.entity?.firstTime);
    lastHours = TextEditingController(text: widget.entity?.lastTime);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            Container(
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
                  CaupeTitleWidget(title: 'Edit/Add Available Hours')
                      .withBottomPadding(),
                  Divider(color: Colors.grey[600]).withBottomPadding(),
                  AvailableDaysList(
                    onDay: (day) {
                      if (days.contains(day)) {
                        days.remove(day);
                      } else {
                        days.add(day);
                      }
                      setState(() {});
                    },
                    selectDays: days,
                  ),
                  AppDefault.defaultSpaceHeight(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: firstHours,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            HoraInputFormatter(),
                          ],
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.timelapse),
                            hintText: '00:00',
                            border: OutlineInputBorder(
                              borderRadius:
                                  AppDefault.defaultBorderRadius(radius: 5),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: Colors.grey,
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: lastHours,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            HoraInputFormatter(),
                          ],
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.timelapse),
                            hintText: '00:00',
                            border: OutlineInputBorder(
                              borderRadius:
                                  AppDefault.defaultBorderRadius(radius: 5),
                            ),
                          ),
                        ).withRightPadding(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 35, horizontal: 15),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor),
                      ),
                      onPressed: () {
                        if (days.isEmpty) {
                          AppDefault.showSnackBarError(
                            title: 'Verifique os campos',
                            message: 'Selecione os dias!',
                          );
                          return;
                        }
                        if (firstHours.text.isEmpty || lastHours.text.isEmpty) {
                          AppDefault.showSnackBarError(
                            title: 'Verifique os campos',
                            message: 'Digite um horario válido!',
                          );
                          return;
                        }
                        if (firstHours.text.length < 5 ||
                            lastHours.text.length < 5) {
                          AppDefault.showSnackBarError(
                            title: 'Verifique os campos',
                            message: 'Formato de data hora inválido!',
                          );
                          return;
                        }

                        if (int.parse(firstHours.text.split(':').join()) >=
                            int.parse(lastHours.text.split(':').join())) {
                          AppDefault.showSnackBarError(
                            title: 'Verifique os campos',
                            message: 'A hora inicial é maior que a final.',
                          );
                          return;
                        }

                        widget.onAvailable(
                          AvailableModel(
                            guid: guid,
                            days: days,
                            firstTime: firstHours.text.trim(),
                            lastTime: lastHours.text.trim(),
                          ),
                        );
                        Get.back();
                      },
                      child: Text('Confirme hours'),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
