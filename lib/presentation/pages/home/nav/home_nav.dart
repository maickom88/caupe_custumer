import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';
import '../../../components/components.dart';

class HomeNav extends StatelessWidget {
  const HomeNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppDefault.defaultBorderRadiusOnly(),
      child: ListView(
        clipBehavior: Clip.none,
        children: [
          CaupeTitleWidget(
            title: 'Financial Summary',
          ).withBottomPadding(),
          CaupeSummary(meta: '80%', total: 'R\$200,00')
              .withBottomPadding(bottomPadding: 20),
          CaupeTitleWidget(
            title: 'Upcoming Appointments',
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            height: 270,
            child: ListView.builder(
              itemCount: 2,
              clipBehavior: Clip.none,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => CaupeCardDetails(),
            ),
          ),
          CaupeTitleWidget(
            title: 'Clients Reviews',
          ),
          Container(
            padding: EdgeInsets.only(right: 8),
            width: double.infinity,
            height: 160,
            child: ListView.builder(
              clipBehavior: Clip.none,
              itemCount: 2,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => CaupeClientsReviews(),
            ),
          ),
          SizedBox(height: 30)
        ],
      ).withTopPadding(topPadding: 10).withSymPadding(),
    );
  }
}
