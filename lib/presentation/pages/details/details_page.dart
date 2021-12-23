import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_%20typography.dart';
import '../../../core/theme/theme.dart';
import '../../components/components.dart';
import 'widgets/widgets.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CaupeAvatarRectangle(
                  image:
                      'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?cs=srgb&dl=pexels-pixabay-220453.jpg&fm=jpg',
                  width: 120,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Michael Joe',
                      style: AppTypography.t18WithW800(),
                    ),
                    // Row(
                    //   children: [1, 2, 3, 4]
                    //       .map((e) => Icon(Icons.star, color: Colors.grey[00]))
                    //       .toList(),
                    // )
                  ],
                ),
              ],
            ),
            AppDefault.defaultSpaceHeight(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CaupeTitleWidget(title: 'Booking Number'),
                Text('2309', style: AppTypography.t16()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CaupeTitleWidget(title: 'Date/Time'),
                Text('23/02/20 12:20', style: AppTypography.t16()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CaupeTitleWidget(title: 'Status'),
                Text(
                  'Closed',
                  style: AppTypography.t16().copyWith(color: Colors.red[400]),
                ),
              ],
            ),
            AppDefault.defaultSpaceHeight(),
            CaupeTitleWidget(title: 'Services'),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: AppDefault.hPadding, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: AppDefault.defaultBorderRadius(),
              ),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 2,
                shrinkWrap: true,
                itemBuilder: (_, index) => ServiceValues(
                  service: 'Unha',
                  price: 50.0,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: AppDefault.hPadding,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ServiceValues(
                    service: 'Tax',
                    price: 50.0,
                  ),
                  ServiceValues(
                    service: 'Total',
                    price: 120.0,
                  ),
                ],
              ),
            ),
            AppDefault.defaultSpaceHeight(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CaupeTitleWidget(title: 'Location'),
                SizedBox(width: 20),
                Flexible(
                  child: Text(
                    'Rua Alvaro pinheiro',
                    textAlign: TextAlign.end,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.t16(),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CaupeTitleWidget(title: 'Payment method'),
                SizedBox(width: 20),
                Flexible(
                  child: Text(
                    'Credit Card',
                    textAlign: TextAlign.end,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.t16(),
                  ),
                ),
              ],
            ),
          ],
        ).withAllPadding(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Theme.of(context).primaryColor),
          ),
          child: Text('Evaluetion'),
          onPressed: () {
            showFlexibleBottomSheet(
              minHeight: 200,
              initHeight: 0.3,
              maxHeight: 0.3,
              context: context,
              builder: (
                context,
                scrollController,
                bottomSheetOffset,
              ) =>
                  EvaluetionBottomSheet(
                scrollController: scrollController,
                onEvaluetion: (value) => print(value),
              ),
              anchors: [0, 0.5, 1],
            );
          },
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 2,
      title: Text(
        'DETAILS SERVICE',
        style: AppTypography.t16WithW800().copyWith(color: Colors.black87),
      ),
      backgroundColor: Colors.white,
    );
  }
}
