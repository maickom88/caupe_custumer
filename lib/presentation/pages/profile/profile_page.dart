import 'dart:io';

import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/extensions/extensions.dart';
import '../../../core/theme/theme.dart';
import '../../../factories/build_service/build_get_categories.dart';
import '../../components/components.dart';
import 'profile.dart';
import 'widgets/widgets.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        physics: BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverList(
              delegate: SliverChildListDelegate([
                Obx(
                  () => HeaderProfile(
                    photoUrl: controller.user.value?.photo ??
                        'https://miro.medium.com/max/720/1*W35QUSvGpcLuxPo3SRTH4w.png',
                    onChangeAvatar: (File file) =>
                        controller.updateAvatar(file),
                  ),
                ),
              ]),
            ),
          ];
        },
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: AppDefault.hPadding,
            vertical: AppDefault.vPadding,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: AppDefault.defaultBorderRadiusOnly(),
          ),
          child: Material(
            color: Colors.transparent,
            child: SingleChildScrollView(
              clipBehavior: Clip.none,
              child: Column(
                children: [
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            controller.user.value?.name ?? '',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: AppTypography.t18WithW800(),
                          ),
                        ),
                        AppDefault.defaultSpaceWidth(),
                        EditActionButton(
                          onTap: () {
                            showFlexibleBottomSheet(
                              minHeight: 200,
                              initHeight: 0.3,
                              maxHeight: 0.7,
                              context: context,
                              builder: (
                                context,
                                scrollController,
                                bottomSheetOffset,
                              ) =>
                                  EditNameBottomSheet(
                                scrollController: scrollController,
                                value: controller.user.value?.name ?? '',
                                onValue: (String value) {
                                  controller.user.value?.name = value;
                                  controller.updateInformation();
                                },
                              ),
                              anchors: [0, 0.5, 1],
                            );
                          },
                        ),
                      ],
                    ).withBottomPadding(),
                  ),
                  Text(
                    controller.authResponseModel.email?.lock() ?? '',
                    style:
                        AppTypography.t14().copyWith(color: Colors.grey[500]),
                  ),
                  Text(
                    controller.user.value?.document?.lockDocument() ?? '',
                    style:
                        AppTypography.t14().copyWith(color: Colors.grey[500]),
                  ),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(
                                    Icons.phone,
                                    color: Colors.green[400],
                                  ),
                                ),
                                TextSpan(
                                    text: controller
                                            .user.value?.information?.phone ??
                                        ' Adicionar')
                              ],
                              style: AppTypography.t18WithW800()
                                  .copyWith(color: Colors.green[300]),
                            ),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        AppDefault.defaultSpaceWidth(),
                        EditActionButton(
                          onTap: () {
                            showFlexibleBottomSheet(
                              minHeight: 200,
                              initHeight: 0.3,
                              maxHeight: 0.7,
                              context: context,
                              builder: (
                                context,
                                scrollController,
                                bottomSheetOffset,
                              ) =>
                                  EditPhoneBottomSheet(
                                scrollController: scrollController,
                                value:
                                    controller.user.value?.information?.phone,
                                onTap: (phone) async {
                                  if (phone != null) {
                                    await controller
                                        .sendSmsPhoneAuthentication(phone);
                                    Get.dialog(
                                      NumberCodeConfirmation(
                                        onCode: (otp) async {
                                          await controller
                                              .authenticationPhoneWithCode(
                                                  otp, phone);
                                        },
                                      ),
                                      barrierColor:
                                          Colors.white.withOpacity(0.3),
                                    );
                                  }
                                },
                              ),
                              anchors: [0, 0.5, 1],
                            );
                          },
                        ),
                      ],
                    ).withBottomPadding(),
                  ),
                  Obx(
                    () => Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          vertical: 15, horizontal: AppDefault.hPadding),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: AppDefault.defaultBoxShadow(),
                        borderRadius: AppDefault.defaultBorderRadius(),
                      ),
                      child: Material(
                        child: Column(
                          children: [
                            Text(
                              controller.user.value?.information?.address ??
                                  'Adicione seu endereço',
                              textAlign: TextAlign.center,
                              style: AppTypography.t16(),
                            ).withBottomPadding(),
                            EditActionButton(
                              onTap: () {
                                showFlexibleBottomSheet(
                                  minHeight: 200,
                                  initHeight: 0.3,
                                  maxHeight: 0.7,
                                  context: context,
                                  builder: (
                                    context,
                                    scrollController,
                                    bottomSheetOffset,
                                  ) =>
                                      EditAddressBottomSheet(
                                    scrollController: scrollController,
                                    value: controller
                                        .user.value?.information?.address,
                                    onValue: (value) {
                                      controller.user.value?.information
                                          ?.address = value;
                                      controller.updateInformation();
                                    },
                                  ),
                                  anchors: [0, 0.5, 1],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  AppDefault.defaultSpaceHeight(),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                        vertical: 15, horizontal: AppDefault.hPadding),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                      borderRadius: AppDefault.defaultBorderRadius(),
                    ),
                    child: Material(
                      child: Column(
                        children: [
                          Obx(
                            () => Text(
                              controller.user.value?.information?.description ??
                                  'Adicione uma descrição',
                              textAlign: TextAlign.center,
                              style: AppTypography.t16(),
                            ).withBottomPadding(),
                          ),
                          EditActionButton(
                            onTap: () {
                              showFlexibleBottomSheet(
                                minHeight: 200,
                                initHeight: 0.4,
                                maxHeight: 0.7,
                                context: context,
                                builder: (
                                  context,
                                  scrollController,
                                  bottomSheetOffset,
                                ) =>
                                    EditDescriptionBottomSheet(
                                  scrollController: scrollController,
                                  value: controller
                                      .user.value?.information?.description,
                                  onValue: (value) async {
                                    AppDefault.showDefaultLoad();
                                    controller.user.value?.information
                                        ?.description = value;
                                    await controller.updateInformation();
                                    AppDefault.close();
                                  },
                                ),
                                anchors: [0, 0.5, 1],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  AppDefault.defaultSpaceHeight(),
                  TitleWithAction(
                    onTap: () async {
                      final images = await ImagePicker().getMultiImage();
                      if (images != null) {
                        final files =
                            images.map((image) => File(image.path)).toList();
                        AppDefault.showDefaultLoad();
                        await controller.addPhotoPortfolio(files);
                        AppDefault.close();
                      }
                    },
                    title: 'Portfolio',
                  ).withBottomPadding(),
                  Obx(() {
                    if (controller.portfolioEntity.isEmpty) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Você ainda não possui imagens'),
                          Text(
                            'Aumente a visibilidade do seu negocio adicionando imagens do seu trabalho!',
                            textAlign: TextAlign.center,
                            style: AppTypography.t14()
                                .copyWith(color: Colors.grey),
                          ),
                        ],
                      );
                    }
                    return CarouselSlider.builder(
                      options: buildCarouselOptionsPortfolio(),
                      itemCount: controller.portfolioEntity.length,
                      itemBuilder: (_, index, dot) => PortfolioCard(
                        url: controller.portfolioEntity[index].link,
                        onDelete: () async {
                          AppDefault.showDefaultLoad();
                          await controller.deletePhotoPortfolio(
                              controller.portfolioEntity[index].guid);
                          controller.portfolioEntity.removeAt(index);
                          AppDefault.close();
                        },
                      ),
                    ).withBottomPadding();
                  }),
                  Obx(
                    () => RowDots(
                      index: DotsNavigation.indexPage.value,
                      length: controller.portfolioEntity.length,
                    ),
                  ),
                  AppDefault.defaultSpaceHeight(),
                  TitleWithAction(
                    onTap: () async {
                      await showFlexibleBottomSheet(
                        minHeight: 200,
                        initHeight: 0.7,
                        maxHeight: 0.95,
                        useRootNavigator: true,
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
                            services: controller.services,
                            onService: (service) async {
                              AppDefault.showDefaultLoad();
                              await controller.updateAllService(service);
                              AppDefault.close();
                            },
                          );
                        },
                        anchors: [0, 0.5, 1],
                      );
                      Get.delete<ServiceController>();
                    },
                    title: 'Services',
                  ).withBottomPadding(),
                  Obx(() {
                    if (controller.services.isEmpty) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Você ainda não possui serviços'),
                          Text(
                            'Aumente a visibilidade do seu negocio adicionando serviços e detalhes!',
                            textAlign: TextAlign.center,
                            style: AppTypography.t14()
                                .copyWith(color: Colors.grey),
                          ),
                        ],
                      );
                    }
                    return Obx(
                      () => CarouselSlider.builder(
                        options: buildCarouselOptions(),
                        itemCount: controller.services.length,
                        itemBuilder: (_, index, dot) => CardService(
                          service: controller.services[index],
                          onDelete: () => controller.deleteAService(
                              controller.services[index].guid!, index),
                          onService: (service) async {
                            AppDefault.showDefaultLoad();
                            await controller.updateAllService(service);
                            AppDefault.close();
                            AppDefault.close();
                          },
                        ),
                      ),
                    );
                  }),
                  AppDefault.defaultSpaceHeight(),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                        horizontal: AppDefault.hPadding, vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: AppDefault.defaultBorderRadius(),
                      boxShadow: AppDefault.defaultBoxShadow(),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CaupeTitleWidget(title: 'Available day/ hour')
                            .withBottomPadding(),
                        Divider(color: Colors.grey).withBottomPadding(),
                        Text(
                          'Choose your service location',
                          style: AppTypography.t16(),
                        ),
                        Obx(() {
                          if (controller.user.value == null) {
                            return Container();
                          }
                          return AvailableCities(
                            onCity: (city) =>
                                controller.updateAvailableCities(city),
                            // ignore: invalid_use_of_protected_member
                            cities: controller.cities.value,
                            initialCities:
                                controller.user.value!.information?.locations,
                            onDeleteCity: (city) => controller.deleteCity(city),
                          );
                        }),
                        SizedBox(height: 20),
                        CaupeTitleWidget(title: 'Available day/ hour'),
                        Obx(() {
                          if (controller.availables.isEmpty) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                      child: Text(
                                          'Você ainda não possui registro')),
                                  Text(
                                    'Comece agora',
                                    textAlign: TextAlign.center,
                                    style: AppTypography.t14()
                                        .copyWith(color: Colors.grey),
                                  ),
                                ],
                              ),
                            );
                          }
                          return ListView.separated(
                            shrinkWrap: true,
                            itemCount: controller.availables.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (_, index) => Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: AvailableHours(
                                entity: controller.availables[index],
                                onUpdate: (available) {
                                  controller.availables[index] = available;
                                  controller.updateAllAvailable(available);
                                },
                                onDelete: () {
                                  controller.deleteAvailableHours(
                                      controller.availables[index].guid!);
                                  controller.availables.removeAt(index);
                                  Get.back();
                                },
                              ),
                            ),
                            separatorBuilder: (_, __) =>
                                Divider(height: 3, color: Colors.grey[400]),
                          );
                        }),
                        CaupeButtonAdd(
                          onTap: () {
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
                                onAvailable: (available) {
                                  controller.updateAllAvailable(available);
                                },
                              ),
                              anchors: [0, 0.5, 1],
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  CarouselOptions buildCarouselOptionsPortfolio() {
    return CarouselOptions(
      height: 200,
      enlargeCenterPage: true,
      aspectRatio: 2.0,
      onPageChanged: (indexPage, page) {
        DotsNavigation.indexPage.value = indexPage;
      },
      initialPage: 2,
    );
  }

  CarouselOptions buildCarouselOptions() {
    return CarouselOptions(
      enlargeCenterPage: true,
      height: 320,
      enlargeStrategy: CenterPageEnlargeStrategy.scale,
      aspectRatio: 2.0,
      viewportFraction: 0.8,
      initialPage: 2,
    );
  }
}
