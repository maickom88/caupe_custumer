import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../core/theme/theme.dart';
import 'terms_and_conditions_controller.dart';

class TermsAndConditionsPage extends StatefulWidget {
  const TermsAndConditionsPage({Key? key}) : super(key: key);

  @override
  _TermsAndConditionsPageState createState() => _TermsAndConditionsPageState();
}

class _TermsAndConditionsPageState extends State<TermsAndConditionsPage> {
  late TermsOfConditionsController controller;

  @override
  void initState() {
    controller = Get.find<TermsOfConditionsController>();
    controller.getTermsOfConditions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: AppBar(
        brightness: Brightness.dark,
        toolbarHeight: 0,
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Theme.of(context).secondaryHeaderColor,
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
                    'TERMS AND CONDITIONS'.toUpperCase(),
                    style: AppTypography.t16WithW800(),
                  )
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            child: Container(
              width: Get.width,
              padding: EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: AppDefault.defaultBorderRadiusOnly(),
              ),
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                children: [
                  Obx(() {
                    if (controller.terms.value != null) {
                      return Text(controller.terms.value!.term);
                    }
                    return Container(
                      height: 50,
                      child: Center(
                        child: LoadingIndicator(
                          indicatorType: Indicator.lineScale,
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                      ),
                    );
                  }),
                  SizedBox(height: 30),
                ],
              ),
            ).withTopPadding(topPadding: 20),
          ),
        ],
      ),
    );
  }
}
