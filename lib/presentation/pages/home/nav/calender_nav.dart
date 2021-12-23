import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../../core/enums/enums.dart';
import '../../../../core/theme/theme.dart';
import '../widgets/widgets.dart';

class CalenderNav extends StatefulWidget {
  const CalenderNav({Key? key}) : super(key: key);

  @override
  _CalenderNavState createState() => _CalenderNavState();
}

class _CalenderNavState extends State<CalenderNav> {
  late TypeCalender typeCalender;

  @override
  void initState() {
    typeCalender = TypeCalender.agenda;
    super.initState();
  }

  updateType(TypeCalender type) {
    setState(() {
      typeCalender = type;
    });
    print(type);
  }

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    return ClipRRect(
      borderRadius: AppDefault.defaultBorderRadiusOnly(),
      child: ListView(
        controller: scrollController,
        clipBehavior: Clip.none,
        children: [
          CalenderType(
            onType: (type) => updateType(type),
          ).withBottomPadding(bottomPadding: 20),
          CalenderWidget(typeCalender: typeCalender),
          AppDefault.defaultSpaceHeight(),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (_, index) => CardCalender(),
          ),
          SizedBox(height: 80),
        ],
      ).withTopPadding(topPadding: 10).withSymPadding(),
    );
  }
}
