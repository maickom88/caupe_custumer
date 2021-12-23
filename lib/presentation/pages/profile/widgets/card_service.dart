import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:caupe_custumer/data/models/service_model.dart';
import 'package:caupe_custumer/factories/build_service/build_get_categories.dart';
import 'package:caupe_custumer/presentation/pages/profile/widgets/widgets.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../core/theme/theme.dart';
import '../../../../domain/entities/service_entity.dart';
import '../profile.dart';

class CardService extends StatelessWidget {
  final ServiceEntity service;
  final VoidCallback onDelete;
  final Function(ServiceEntity) onService;
  const CardService(
      {Key? key,
      required this.onDelete,
      required this.service,
      required this.onService})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: AppDefault.defaultBorderRadius(),
          color: Colors.white,
          boxShadow: AppDefault.defaultBoxShadow(),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headerService(
                context,
                photo: service.typeService.photo,
                onUpdate: (service) => onService(service),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    service.typeService.title,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.t16WithW800(),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  Text(
                    'Subcategory',
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.t16(),
                  ),
                  AppDefault.defaultSpaceHeight(),
                  ...service.value.map((e) => buildSubcategory(
                      name: e.subCategory?.title ?? '',
                      price: 'R\$${e.price}',
                      hours: '${e.hours.hour}h ${e.hours.minute}m')),
                  AppDefault.defaultSpaceHeight(height: 10),
                ],
              ).withAllPadding(),
            ],
          ),
        ),
      ),
    );
  }

  Row buildSubcategory({
    required String hours,
    required String price,
    required String name,
  }) {
    return Row(
      children: [
        Expanded(
          child: Tooltip(
            message: name,
            child: Text(
              name,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            hours,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.grey[400],
            ),
          ),
        ),
        Expanded(
          child: Tooltip(
            message: price,
            child: Text(
              price,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.green[400],
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container headerService(BuildContext context,
      {required String photo, required Function(ServiceModel) onUpdate}) {
    return Container(
      width: double.infinity,
      height: 125,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius:
            AppDefault.defaultBorderRadiusOnly(topLeft: 15, topRight: 15),
        image: DecorationImage(
          image: ExtendedNetworkImageProvider(
            photo,
            cache: true,
            timeLimit: Duration(days: 15),
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: 50,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: AppDefault.defaultBorderRadius(radius: 10),
              ),
              child: InkWell(
                borderRadius: AppDefault.defaultBorderRadius(radius: 10),
                onTap: () async {
                  await showAdaptiveActionSheet(
                    context: context,
                    actions: <BottomSheetAction>[
                      BottomSheetAction(
                        title: Text(
                          'Edit',
                          style: AppTypography.t16(),
                        ),
                        onPressed: () {
                          showFlexibleBottomSheet(
                            initHeight: 0.98,
                            maxHeight: 0.99,
                            context: context,
                            builder: (
                              context,
                              scrollController,
                              bottomSheetOffset,
                            ) {
                              Get.lazyPut(
                                () => ServiceController(
                                  getCategories: buildGetCategories(),
                                ),
                              );
                              return ServiceEdit(
                                scrollController: scrollController,
                                onService: (service) => onUpdate(service),
                                service: service,
                              );
                            },
                            anchors: [0, 1],
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
                            Get.back();
                          },
                        ),
                      ),
                    ],
                    cancelAction: CancelAction(
                      title: const Text('Cancel'),
                    ), // onPressed parameter is optional by default will dismiss the ActionSheet
                  );
                  Get.delete<ServiceController>();
                },
                onLongPress: () => HapticFeedback.vibrate(),
                child: Tooltip(
                  message: "Editar serviço",
                  child: Icon(Icons.more_vert, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
