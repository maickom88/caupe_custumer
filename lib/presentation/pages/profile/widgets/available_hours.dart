import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:get/get.dart';
import '../../../../data/models/available_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../domain/entities/available_entity.dart';
import '../../../../core/enums/type_days.dart';
import '../../../../core/theme/theme.dart';
import 'widgets.dart';

class AvailableHours extends StatelessWidget {
  final AvailableEntity entity;
  final VoidCallback onDelete;
  final Function(AvailableModel availabel)? onUpdate;
  const AvailableHours({
    Key? key,
    this.onUpdate,
    required this.onDelete,
    required this.entity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: entity.days
              .map(
                (e) => BoxDay(
                  day: e.dayInStringAbbreviated(),
                ),
              )
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              entity.firstTime,
              style: AppTypography.t16(),
            ),
            Icon(Icons.arrow_right),
            Text(
              entity.lastTime,
              style: AppTypography.t16(),
            ),
            Material(
              color: Colors.transparent,
              child: Container(
                width: 50,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: AppDefault.defaultBorderRadius(radius: 10),
                ),
                child: InkWell(
                  borderRadius: AppDefault.defaultBorderRadius(radius: 10),
                  onTap: () {
                    showAdaptiveActionSheet(
                      context: context,
                      actions: <BottomSheetAction>[
                        BottomSheetAction(
                          title: Text(
                            'Edit',
                            style: AppTypography.t16(),
                          ),
                          onPressed: () {
                            showFlexibleBottomSheet(
                              minHeight: 200,
                              initHeight: 0.5,
                              maxHeight: 0.95,
                              context: context,
                              builder: (
                                context,
                                scrollController,
                                bottomSheetOffset,
                              ) =>
                                  AddHoursAvailable(
                                scrollController: scrollController,
                                entity: entity,
                                onAvailable: (available) {
                                  onUpdate?.call(available);
                                  Get.back();
                                },
                              ),
                              anchors: [0, 0.5, 1],
                            );
                          },
                        ),
                        BottomSheetAction(
                          title: Text(
                            'Remove',
                            style: AppTypography.t16().copyWith(
                              color: Colors.red[400],
                            ),
                          ),
                          onPressed: () => AppDefault.showDeleteBottomSheet(
                            context,
                            action: () {
                              onDelete.call();
                            },
                          ),
                        ),
                      ],
                      cancelAction: CancelAction(
                        title: const Text('Cancel'),
                      ), // onPressed parameter is optional by default will dismiss the ActionSheet
                    );
                  },
                  onLongPress: () => HapticFeedback.vibrate(),
                  child: Tooltip(
                    message: "Editar serviço",
                    child: Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class BoxDay extends StatelessWidget {
  final String day;
  const BoxDay({
    Key? key,
    required this.day,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
            ),
          ),
          Text(
            day,
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ],
      ),
    );
  }
}
