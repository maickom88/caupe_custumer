import 'package:caupe_custumer/data/models/category_model.dart';
import 'package:caupe_custumer/data/models/sub_category_type_model.dart';
import 'package:caupe_custumer/domain/entities/service_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../../core/theme/theme.dart';
import '../../../../data/models/models.dart';
import '../../../components/components.dart';
import '../profile.dart';
import 'widgets.dart';

class ServiceEdit extends StatefulWidget {
  final ScrollController scrollController;
  final ServiceEntity? service;
  final List<ServiceEntity>? services;
  final Function(ServiceModel) onService;
  const ServiceEdit({
    Key? key,
    required this.onService,
    this.service,
    this.services,
    required this.scrollController,
  }) : super(key: key);

  @override
  _ServiceEditState createState() => _ServiceEditState();
}

class _ServiceEditState extends State<ServiceEdit> {
  final ServiceController controller = Get.find<ServiceController>();
  late List<SubCategoryModel> categories;
  ServiceEntity? service;
  @override
  void initState() {
    categories = [];
    controller.getServices(service: widget.service);
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
              padding: EdgeInsets.only(
                  top: 20,
                  bottom: 50,
                  left: AppDefault.hPadding,
                  right: AppDefault.hPadding),
              decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Obx(() {
                if (controller.load.value) {
                  return Center(
                    child: Container(
                      height: 50,
                      child: Center(
                        child: LoadingIndicator(
                          indicatorType: Indicator.lineScale,
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                      ),
                    ),
                  );
                }
                return ListView(
                  padding: EdgeInsets.zero,
                  controller: widget.scrollController,
                  clipBehavior: Clip.none,
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
                    CaupeTitleWidget(title: 'Edit/Add Service')
                        .withBottomPadding(),
                    Divider(color: Colors.grey[600]).withBottomPadding(),
                    Text(
                      'Choose Service',
                      style: AppTypography.t16(),
                    ).withBottomPadding(),
                    Obx(
                      () => TypeService(
                        onService: (service) async {
                          controller.category.value = null;
                          await Future.delayed(Duration(milliseconds: 100), () {
                            controller.category.value = service;
                          });
                        },
                        uid: controller.category.value?.guid,
                        categories: controller.categories,
                      ),
                    ),
                    Text(
                      'Choose sub category',
                      style: AppTypography.t16(),
                    ).withBottomPadding(),
                    Obx(() {
                      if (controller.category.value != null) {
                        if (widget.service != null) service = widget.service;
                        if (widget.services != null) {
                          final services = widget.services
                              ?.where((s) =>
                                  s.typeService.guid ==
                                  controller.category.value?.guid)
                              .toList();
                          if (services != null) {
                            if (services.isNotEmpty) {
                              service = services[0];
                            }
                          }
                        }
                        return Obx(
                          () => SubCategoryBox(
                            onCategory: (category) => categories = category,
                            category: controller.category.value!,
                            service: service,
                          ),
                        );
                      }
                      return SizedBox();
                    }),
                    AppDefault.defaultSpaceHeight(height: 45),
                  ],
                );
              }),
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
                        if (categories.isEmpty) {
                          AppDefault.showSnackBarError(
                              message: 'Preencha todos os campos',
                              title: 'Campos obrigatórios');
                        } else if (categories
                                .where((element) =>
                                    element.price == null ||
                                    element.hours == null)
                                .length >
                            0) {
                          AppDefault.showSnackBarError(
                              message: 'Preencha todos os campos',
                              title: 'Campos obrigatórios');
                        } else if (categories
                                .where((element) => element.price! <= 0)
                                .length >
                            0) {
                          AppDefault.showSnackBarError(
                              message: 'Preencha todos os campos',
                              title: 'Adicione os valores corretamentes');
                        } else {
                          final serviceModel = ServiceModel(
                            guid: service?.guid,
                            typeService: CategoryModel(
                              background: controller.category.value?.background,
                              guid: controller.category.value?.guid,
                              photo: controller.category.value!.photo,
                              subCategories: categories
                                  .map((e) => SubCategoryTypeModel(
                                        guid: e.guid,
                                        title: e.title,
                                      ))
                                  .toList(),
                              title: controller.category.value!.title,
                            ),
                            value: categories
                                .map(
                                  (e) => PriceModel(
                                    guid: e.guid,
                                    hours: e.hours!,
                                    price: e.price!,
                                  ),
                                )
                                .toList(),
                          );
                          widget.onService(serviceModel);
                          Get.back();
                        }
                      },
                      child: Text('Confirme service'),
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
