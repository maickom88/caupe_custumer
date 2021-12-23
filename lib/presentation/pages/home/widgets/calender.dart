import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/enums/enums.dart';
import 'list_calender_job.dart';

class CalenderWidget extends StatefulWidget {
  final TypeCalender typeCalender;
  const CalenderWidget({
    Key? key,
    required this.typeCalender,
  }) : super(key: key);
  @override
  CalenderWidgetState createState() => CalenderWidgetState();
}

class CalenderWidgetState extends State<CalenderWidget> {
  @override
  void initState() {
    super.initState();
  }

  var days = [
    DateTime.utc(2021, 6, 10),
    DateTime.utc(2021, 6, 20),
  ];
  bool verify(DateTime date) {
    for (var i = 0; i < days.length; i++) {
      if (days[i].compareTo(date) == 0) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: widget.typeCalender == TypeCalender.agenda
            ? Color(0xff303030)
            : Color(0xFF0A0A0A),
      ),
      duration: Duration(milliseconds: 350),
      curve: Curves.easeInCubic,
      child: Material(
        color: Colors.transparent,
        child: TableCalendar(
          holidayPredicate: (date) => verify(date),
          headerStyle: HeaderStyle(
            titleCentered: true,
            formatButtonDecoration: BoxDecoration(
              border: const Border(
                bottom: BorderSide(color: Colors.white),
              ),
            ),
            formatButtonVisible: false,
            rightChevronIcon: Icon(
              Icons.chevron_right,
              color: Colors.white,
            ),
            leftChevronIcon: Icon(
              Icons.chevron_left,
              color: Colors.white,
            ),
            titleTextStyle:
                const TextStyle(fontSize: 17.0, color: Colors.white),
          ),
          startingDayOfWeek: StartingDayOfWeek.monday,
          calendarStyle: CalendarStyle(
            selectedDecoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
            ),
            holidayTextStyle: TextStyle(color: Colors.white),
            outsideTextStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
            defaultTextStyle: TextStyle(color: Colors.white),
            markerDecoration: BoxDecoration(color: Colors.yellow[700]),
            selectedTextStyle: TextStyle(color: Color(0xFF5C6BC0)),
            weekendTextStyle: TextStyle(color: Color(0xFF8F63F7)),
          ),
          locale: 'pt_BR',
          onDaySelected: (selectedDay, focusedDay) {
            if (verify(selectedDay)) {
              showFlexibleBottomSheet(
                minHeight: 200,
                initHeight: 0.5,
                maxHeight: 0.95,
                context: context,
                builder: (
                  context,
                  scrollController,
                  bottomSheetOffset,
                ) =>
                    ListCalenderJob(
                  scrollController: scrollController,
                ),
                anchors: [0, 0.5, 1],
              );
            }
          },
          daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: TextStyle(color: Colors.white),
            weekendStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
          ),
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: DateTime.utc(2021, 6, 22),
        ),
      ),
    );
  }
}
