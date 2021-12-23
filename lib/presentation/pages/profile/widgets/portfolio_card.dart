import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../core/theme/theme.dart';
import '../../../components/components.dart';

class PortfolioCard extends StatelessWidget {
  final String url;
  final VoidCallback onDelete;
  const PortfolioCard({
    Key? key,
    required this.onDelete,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        borderRadius: AppDefault.defaultBorderRadius(),
        color: Colors.grey[100],
      ),
      child: Stack(
        children: [
          buildPhotoBackground(url),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              child: ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.red[700],
                  ),
                ),
                onPressed: () => AppDefault.showDeleteBottomSheet(
                  context,
                  action: onDelete,
                ),
                onLongPress: () => HapticFeedback.vibrate(),
                icon: Icon(
                  Icons.delete,
                  size: 17,
                ),
                label: Tooltip(
                  message: 'Deletar',
                  child: Text(
                    'Delete',
                    style: AppTypography.t14(),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  InkWell buildPhotoBackground(String url) {
    return InkWell(
      onTap: () => Get.dialog(
          CaupePreviewImage(
            image: url,
          ),
          barrierColor: Colors.white.withOpacity(0.4)),
      child: ClipRRect(
        borderRadius: AppDefault.defaultBorderRadius(),
        child: ExtendedImage.network(
          url,
          cache: true,
          width: double.infinity,
          fit: BoxFit.cover,
          height: double.infinity,
          timeLimit: Duration(days: 15),
        ),
      ),
    );
  }
}
