import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'help.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/theme.dart';
import '../../components/components.dart';
import 'widgets/widgets.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  late HelpController controller;

  @override
  void initState() {
    controller = Get.find<HelpController>();
    final auth = controller.getUserInformation();
    controller.authResponseModel = auth;
    controller.getAllHelps(auth);
    controller.getAllProblems();
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
                    'HELP PAGE'.toUpperCase(),
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
              child: Obx(
                () => ListView(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  children: [
                    CaupeTitleWidget(title: 'Last your client'),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        boxShadow: AppDefault.defaultBoxShadow(),
                        color: Colors.white,
                        borderRadius: AppDefault.defaultBorderRadius(),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildHeaderPhoto(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CaupeTitleWidget(title: 'Amanda Parker'),
                                  SizedBox(width: 30),
                                  Flexible(
                                    child: Text(
                                      '19 Jan, 23:00 hors',
                                      textAlign: TextAlign.end,
                                      style: AppTypography.t14()
                                          .copyWith(color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '24 Avenue, Park Jason',
                                textAlign: TextAlign.start,
                                style: AppTypography.t14()
                                    .copyWith(color: Colors.grey),
                              ).withBottomPadding(),
                              IntrinsicWidth(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.green[400],
                                  ),
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        WidgetSpan(
                                          alignment:
                                              PlaceholderAlignment.middle,
                                          child: Icon(
                                            Icons.check,
                                            color: Colors.white,
                                            size: 13,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' Order completed',
                                          style: AppTypography.t14()
                                              .copyWith(color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ).withBottomPadding(),
                              Divider(color: Colors.grey),
                              Row(
                                children: [
                                  Spacer(),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Help with this order',
                                      style: AppTypography.t16()
                                          .copyWith(color: Colors.red),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ).withAllPadding(),
                        ],
                      ),
                    ),
                    AppDefault.defaultSpaceHeight(),
                    CaupeTitleWidget(title: 'Whats is Problem?'),
                    Obx(() {
                      if (controller.problems.length <= 0) {
                        return SizedBox();
                      }
                      return CarouselSlider.builder(
                        options: buildCarouselOptions(),
                        itemCount: controller.problems.length,
                        itemBuilder: (_, index, __) {
                          final problem = controller.problems[index];
                          return CardWhatsProblem(
                            description: problem.description,
                            title: problem.title,
                            onTap: () async {
                              AppDefault.showDefaultLoad();
                              await controller.sendReportProblem();
                              AppDefault.close();
                              AppDefault.showSnackBarSuccess(
                                  message: "Enviado com sucesso!",
                                  title:
                                      "Obrigado por reportar iremos analisar seu caso!");
                            },
                          );
                        },
                      );
                    }),
                    AppDefault.defaultSpaceHeight(),
                    CaupeTitleWidget(title: 'Common questions')
                        .withBottomPadding(),
                    ...controller.helps
                        .map(
                          (e) => Material(
                            color: Colors.transparent,
                            elevation: 0,
                            child: ListTile(
                              onTap: () {
                                showFlexibleBottomSheet(
                                  minHeight: 200,
                                  initHeight: 0.5,
                                  maxHeight: 0.7,
                                  context: context,
                                  builder: (
                                    context,
                                    scrollController,
                                    bottomSheetOffset,
                                  ) {
                                    return ShowQuestion(
                                      scrollController: scrollController,
                                      help: e,
                                      onUpdate: (e, bool isGood) =>
                                          controller.saveEvaluetion(
                                        isGood,
                                        e.guid,
                                        e.evaluation?.guid,
                                      ),
                                    );
                                  },
                                  anchors: [0, 0.5, 1],
                                );
                              },
                              title: Text(e.title),
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                        )
                        .toList(),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ).withTopPadding(topPadding: 20),
          ),
        ],
      ),
    );
  }

  Container buildHelp({required String title, required String content}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: AppDefault.defaultBorderRadius(),
        boxShadow: AppDefault.defaultBoxShadow(),
        color: Colors.white,
      ),
      child: ExpansionTile(
        title: Text(title),
        children: [
          Text(
            content,
            textAlign: TextAlign.start,
          ).withBottomPadding(),
        ],
      ),
    );
  }

  Container buildHeaderPhoto() {
    return Container(
      width: double.infinity,
      height: 125,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius:
            AppDefault.defaultBorderRadiusOnly(topLeft: 15, topRight: 15),
        image: DecorationImage(
          image: ExtendedNetworkImageProvider(
            'https://images.pexels.com/photos/2253832/pexels-photo-2253832.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
            cache: true,
            timeLimit: Duration(days: 15),
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  CarouselOptions buildCarouselOptions() {
    return CarouselOptions(
      autoPlay: true,
      enlargeStrategy: CenterPageEnlargeStrategy.scale,
      viewportFraction: 1,
      aspectRatio: 2.0,
      initialPage: 2,
    );
  }
}
