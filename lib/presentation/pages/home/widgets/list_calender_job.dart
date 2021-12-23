import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';
import '../../../components/components.dart';

class ListCalenderJob extends StatelessWidget {
  final ScrollController scrollController;

  const ListCalenderJob({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: 20, horizontal: AppDefault.hPadding),
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: AppDefault.defaultBoxShadow(),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            controller: scrollController,
            children: [
              Center(
                child: Container(
                  width: 120,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey[300],
                  ),
                ),
              ),
              AppDefault.defaultSpaceHeight(),
              ...[1, 3, 4]
                  .map((e) => BoxListTile(
                        isClose: e == 1,
                      ))
                  .toList(),
              AppDefault.defaultSpaceHeight(),
            ],
          ),
        ),
      ),
    );
  }
}

class BoxListTile extends StatelessWidget {
  final bool isClose;
  const BoxListTile({
    Key? key,
    this.isClose = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(width: 1, color: Colors.grey.withOpacity(0.3))),
      ),
      child: Material(
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 10),
          onTap: () {},
          trailing: Visibility(
            replacement: Text(
              'Open',
              style: TextStyle(color: Colors.green),
            ),
            visible: isClose,
            child: Text(
              'Close',
              style: TextStyle(color: Colors.red),
            ),
          ),
          leading: CaupeAvatarRectangle(
            width: 80,
            image:
                'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?cs=srgb&dl=pexels-pixabay-220453.jpg&fm=jpg',
          ),
          title: Text(
            'Michael Joe',
            overflow: TextOverflow.ellipsis,
            style: AppTypography.t18WithW800().copyWith(
              color: Colors.grey[800],
            ),
          ),
          subtitle: Text(
            '29 Nov, 12:14 PM',
            overflow: TextOverflow.ellipsis,
            style: AppTypography.t18().copyWith(
              color: Colors.grey[500],
            ),
          ),
        ),
      ),
    );
  }
}
