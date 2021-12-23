import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/theme/theme.dart';

class HeaderProfile extends StatelessWidget {
  final String photoUrl;
  final Function(File file) onChangeAvatar;
  const HeaderProfile({
    Key? key,
    required this.photoUrl,
    required this.onChangeAvatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 230,
          decoration: BoxDecoration(
            color: AppColor.lightColor,
            image: DecorationImage(
              image: AssetImage(AppImages.background),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: AppDefault.defaultBorderRadiusOnly(),
              ),
            ),
          ),
        ),
        buildHeaderAvatar(photoUrl),
        buildHeaderLogo(context),
      ],
    );
  }

  SafeArea buildHeaderLogo(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).secondaryHeaderColor,
            ),
            onPressed: Get.back,
            tooltip: 'Voltar',
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.onlyLogo,
                  height: 30,
                  color: AppColor.primaryColor,
                ),
                Text(
                  'PROFILE'.toUpperCase(),
                  style: AppTypography.t16WithW800().copyWith(
                    color: AppColor.primaryColor,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Positioned buildHeaderAvatar(String photo) {
    return Positioned.fill(
      top: 120,
      child: Material(
        color: Colors.transparent,
        child: Center(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 3, color: Colors.white),
                ),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[200],
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: ExtendedImage.network(
                      photo,
                      cache: true,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      timeLimit: Duration(days: 15),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      color: Colors.grey[200],
                      icon: Icon(
                        Icons.camera_alt,
                        size: 22,
                        color: Colors.grey,
                      ),
                      onPressed: () async {
                        final image = await ImagePicker()
                            .getImage(source: ImageSource.gallery);
                        if (image != null) {
                          final file = File(image.path);
                          onChangeAvatar(file);
                        }
                      },
                      tooltip: 'Abrir galeria',
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
