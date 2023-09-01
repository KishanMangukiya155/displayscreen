import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorSwatch.lerp(Colors.blue, Colors.blueGrey, 1.0),
        body: GestureDetector(
          onVerticalDragUpdate: (details) {
            int sensitivity = 8;
            if (details.delta.dy < -sensitivity) {
              SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                  overlays: [SystemUiOverlay.bottom]);
            }
          },
          child: Row(
            children: [
              Container(
                height: 400,
                width: 400,
                // color: Colors.grey,
                child: SfCalendar(
                  view: CalendarView.month,
                  firstDayOfWeek: 1,
                  // dataSource: MeetingDataSource(_getDataSource()),
                  monthViewSettings: const MonthViewSettings(
                      appointmentDisplayMode:
                          MonthAppointmentDisplayMode.appointment),
                ),
              ),
              SizedBox(width: 35),
              Container(
                child: Center(
                  child: AnalogClock(
                    decoration: BoxDecoration(
                        border: Border.all(width: 3.0, color: Colors.white),
                        gradient: LinearGradient(
                            colors: [Color(0xfffbc2eb), Color(0xffa6c1ee)]),
                        shape: BoxShape.circle), // decoration
                    width: MediaQuery.of(context).size.height / 1.3,
                    isLive: true,
                    hourHandColor: Colors.white,
                    minuteHandColor: Colors.white,
                    showSecondHand: true,
                    secondHandColor: Colors.red,
                    numberColor: Colors.black,
                    tickColor: Colors.yellowAccent,
                    showNumbers: true,
                    textScaleFactor: 1.5,
                    showTicks: true,
                    useMilitaryTime: false,
                    showDigitalClock: true,
                    digitalClockColor: Colors.black,
                    datetime: DateTime.now(),
                  ), // analog clock
                ),
              ),
            ],
          ),
        ));
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 9);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    // meetings.add(Meeting(
    //     'Conference', startTime, endTime, const Color(0xFF0F8644), false));
    return meetings;
  }
}

class MeetingDataSource extends CalendarDataSource {
  // MeetingDataSource(List<Meeting> source) {
  //   appointments = source;
  // }

  // @override
  // DateTime getStartTime(int index) {
  //   return _getMeetingData(index).from;
  // }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  // @override
  // Color getColor(int index) {
  //   return _getMeetingData(index).background;
  // }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;

  DateTime from;

  DateTime to;

  Color background;

  bool isAllDay;
}
