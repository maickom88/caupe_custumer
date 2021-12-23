import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/routes_constants.dart';
import '../../core/theme/theme.dart';

class CaupeDrawer extends StatelessWidget {
  final VoidCallback logout;
  final VoidCallback onBack;
  final String email;
  const CaupeDrawer({
    Key? key,
    required this.onBack,
    required this.logout,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          buildDrawerHeader(email),
          ListTile(
            onTap: () async {
              await Get.toNamed(RoutesConsts.profile);
              onBack.call();
            },
            leading: Icon(Icons.person),
            title: Text(
              'Perfil',
              style: AppTypography.t16().copyWith(color: Colors.grey),
            ),
          ),
          // ListTile(
          //   onTap: () {},
          //   leading: Icon(Icons.favorite),
          //   title: Text(
          //     'Favoritos',
          //     style: AppTypography.t16().copyWith(color: Colors.grey),
          //   ),
          // ),
          // ListTile(
          //   onTap: () {},
          //   leading: Icon(Icons.payment),
          //   title: Text(
          //     'Pagamentos',
          //     style: AppTypography.t16().copyWith(color: Colors.grey),
          //   ),
          // ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.location_city),
            title: Text(
              'Endereços',
              style: AppTypography.t16().copyWith(color: Colors.grey),
            ),
          ),
          ListTile(
            onTap: () => Get.toNamed(RoutesConsts.inviteFriends),
            leading: Icon(Icons.card_giftcard),
            title: Text(
              'Convidar amigos',
              style: AppTypography.t16().copyWith(color: Colors.grey),
            ),
          ),
          ListTile(
            onTap: () => Get.toNamed(RoutesConsts.termsAndConditions),
            leading: Icon(Icons.privacy_tip),
            title: Text(
              'Termos e Condições',
              style: AppTypography.t16().copyWith(color: Colors.grey),
            ),
          ),
          ListTile(
            onTap: () async {
              await Get.toNamed(RoutesConsts.help);
            },
            leading: Icon(Icons.help),
            title: Text(
              'Ajuda',
              style: AppTypography.t16().copyWith(color: Colors.grey),
            ),
          ),
          ListTile(
            onTap: logout,
            leading: Icon(Icons.logout),
            title: Text(
              'Logout',
              style: AppTypography.t16().copyWith(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  DrawerHeader buildDrawerHeader(String email) {
    return DrawerHeader(
      padding: EdgeInsets.zero,
      child: Container(
        width: double.infinity,
        color: AppColor.lightColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  AppImages.onlyLogo,
                  color: AppColor.secondaryColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                email,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: AppTypography.t16()
                    .copyWith(fontWeight: FontWeight.w500)
                    .copyWith(color: Colors.grey[600]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
