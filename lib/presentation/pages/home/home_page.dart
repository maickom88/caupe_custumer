import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/constants/constants.dart';
import '../../../core/theme/theme.dart';
import '../../components/components.dart';
import 'home.dart';
import 'widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int currentIndex;
  late HomeController homeController;

  @override
  void initState() {
    homeController = Get.find<HomeController>();
    currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      drawer: CaupeDrawer(
        email: homeController.authResponseModel.email!,
        logout: () => homeController.signOut(),
        onBack: () => homeController.getUser(homeController.authResponseModel),
      ),
      appBar: AppBar(
        brightness: Brightness.dark,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              centerTitle: true,
              iconTheme: IconThemeData(color: Colors.white),
              backgroundColor: Theme.of(context).secondaryHeaderColor,
              actions: [
                GetBuilder<HomeController>(
                  builder: (_) => CaupeHeaderAvatar(
                    onTap: () async {
                      await Get.toNamed(RoutesConsts.profile);
                      homeController.getUser(homeController.authResponseModel);
                    },
                    url: homeController.user.value?.photo ??
                        'https://miro.medium.com/max/720/1*W35QUSvGpcLuxPo3SRTH4w.png',
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                titlePadding: EdgeInsets.only(top: 5 * 0.2),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.onlyLogo,
                      height: Get.height.percent(3),
                    ),
                    Text(
                      'HOME PAGE',
                      style: AppTypography.t16WithW800(),
                    )
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: AppDefault.defaultBorderRadiusOnly(),
                ),
                child: PageTransitionSwitcher(
                  duration: Duration(milliseconds: 300),
                  transitionBuilder:
                      (child, primaryAnimation, secondaryAnimation) =>
                          FadeThroughTransition(
                    fillColor: Colors.transparent,
                    animation: primaryAnimation,
                    secondaryAnimation: secondaryAnimation,
                    child: child,
                  ),
                  child: NavigationController.navs[currentIndex],
                ),
              ).withTopPadding(topPadding: 20),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: Get.height.percent(12),
        padding:
            EdgeInsets.symmetric(vertical: AppDefault.vPadding, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: AppDefault.defaultBoxShadow(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomItem(
              icon: AppIcons.home,
              label: 'Home',
              onTap: () {
                setState(() {
                  currentIndex = 0;
                });
              },
              isActive: currentIndex == 0,
            ),
            BottomItem(
              icon: AppIcons.calender,
              label: 'Calender',
              onTap: () {
                setState(() {
                  currentIndex = 1;
                });
              },
              isActive: currentIndex == 1,
            ),
            BottomItem(
              icon: AppIcons.money,
              label: 'Finance',
              onTap: () {
                setState(() {
                  currentIndex = 2;
                });
              },
              isActive: currentIndex == 2,
            ),
            BottomItem(
              icon: AppIcons.rating,
              label: 'Reviews',
              onTap: () {
                setState(() {
                  currentIndex = 3;
                });
              },
              isActive: currentIndex == 3,
            ),
          ],
        ),
      ),
    );
  }
}
