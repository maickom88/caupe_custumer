import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';

import '../../../core/constants/routes_constants.dart';
import '../../../core/theme/theme.dart';
import '../../components/components.dart';

class InviteFriendsPage extends StatelessWidget {
  const InviteFriendsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDefault.hPadding,
          vertical: 20,
        ),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Theme.of(context).primaryColor),
            ),
            onPressed: () {
              Share.share(
                'Check is my code!',
                subject: 'Thanks for install!',
              );
            },
            child: Text('Compartilhar'),
          ),
        ),
      ),
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            pinned: true,
            centerTitle: true,
            expandedHeight: 180,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              titlePadding: EdgeInsets.symmetric(vertical: 35),
              title: CaupeHeader(),
            ),
          ),
          SliverFillRemaining(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.lightColor,
                borderRadius: AppDefault.defaultBorderRadiusOnly(),
              ),
              child: Material(
                color: Colors.transparent,
                child: Column(
                  children: [
                    Text(
                      'Indique seu amigo',
                      style: AppTypography.t28WithW800(),
                    ).withBottomPadding(),
                    Text(
                      'Compartilhe seu código abaixo com seus amigos que ainda não ultilizaram o nosso app.',
                      textAlign: TextAlign.center,
                      style: AppTypography.t14().copyWith(
                        color: Colors.grey[600],
                      ),
                    ).withBottomPadding(),
                    TextButton(
                      onPressed: () =>
                          Get.toNamed(RoutesConsts.termsAndConditions),
                      child: Text('Ver termos e condições'),
                    ),
                    AppDefault.defaultSpaceHeight(),
                    InkWell(
                      onTap: () async {
                        await Clipboard.setData(
                            new ClipboardData(text: 'J37SD92'));
                        Get.snackbar(
                          'Copy with text',
                          'Code copy with success!',
                          colorText: Colors.purple[900],
                          overlayBlur: 1,
                          backgroundGradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.topRight,
                            colors: [
                              Theme.of(context).primaryColor,
                              Theme.of(context).primaryColor.withOpacity(0.1),
                            ],
                          ),
                        );
                      },
                      onLongPress: () {
                        HapticFeedback.vibrate();
                      },
                      child: Tooltip(
                        message: 'Copy',
                        child: Container(
                          width: double.infinity,
                          height: 90,
                          decoration: BoxDecoration(
                            borderRadius:
                                AppDefault.defaultBorderRadius(radius: 10),
                            color: Colors.black.withOpacity(0.3),
                            boxShadow: AppDefault.defaultBoxShadow(),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'J37SD92',
                                style: AppTypography.t28WithW800().copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Copiar código',
                                style: AppTypography.t14().copyWith(
                                  color: Colors.white.withOpacity(0.7),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ).withTopPadding(topPadding: 40).withSymPadding(),
              ),
            ).withTopPadding(topPadding: 20),
          ),
        ],
      ),
    );
  }
}
