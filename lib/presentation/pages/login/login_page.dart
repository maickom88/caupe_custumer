import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/theme.dart';
import '../../components/components.dart';
import 'login_controller.dart';
import 'widgets/widgets.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Scaffold(
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
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      InputLogin(
                        onValues: (email, password) =>
                            controller.login(password: password, email: email),
                      ),
                      AppDefault.defaultSpaceHeight(),
                      RowDividerText().withSymPadding(),
                      OnLoginSocial(
                        onProvider: (provider) =>
                            controller.loginSocial(provider),
                      ),
                      RegisterAction(),
                    ],
                  ).withTopPadding(topPadding: 40).withSymPadding(),
                ),
              ).withTopPadding(topPadding: 20),
            ),
          ],
        ),
      ),
    );
  }
}
