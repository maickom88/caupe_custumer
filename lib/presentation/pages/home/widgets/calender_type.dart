import 'package:flutter/material.dart';

import '../../../../core/enums/enums.dart';
import '../../../../core/theme/theme.dart';

class CalenderType extends StatefulWidget {
  final Function(TypeCalender) onType;
  const CalenderType({
    Key? key,
    required this.onType,
  }) : super(key: key);

  @override
  _CalenderTypeState createState() => _CalenderTypeState();
}

class _CalenderTypeState extends State<CalenderType>
    with AutomaticKeepAliveClientMixin {
  late TypeCalender type;
  @override
  void initState() {
    type = TypeCalender.agenda;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            widget.onType(TypeCalender.agenda);
            setState(() {
              type = TypeCalender.agenda;
            });
          },
          child: AnimatedContainer(
            padding: EdgeInsets.symmetric(
                vertical: AppDefault.vPadding, horizontal: 50),
            decoration: BoxDecoration(
              color: type == TypeCalender.agenda
                  ? Theme.of(context).secondaryHeaderColor
                  : Colors.white,
              borderRadius: BorderRadius.circular(100),
            ),
            duration: Duration(milliseconds: 250),
            curve: Curves.easeInBack,
            child: Text(
              'Agenda',
              style: AppTypography.t16WithW800().copyWith(
                color: type == TypeCalender.agenda
                    ? Colors.white
                    : Theme.of(context).secondaryHeaderColor,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            widget.onType(TypeCalender.history);
            setState(() {
              type = TypeCalender.history;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: AppDefault.vPadding, horizontal: 50),
            decoration: BoxDecoration(
              color: type == TypeCalender.history
                  ? Theme.of(context).secondaryHeaderColor
                  : Colors.white,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text(
              'History',
              style: AppTypography.t16WithW800().copyWith(
                color: type == TypeCalender.history
                    ? Colors.white
                    : Theme.of(context).secondaryHeaderColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
