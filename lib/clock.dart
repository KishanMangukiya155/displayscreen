import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'clock_calander.dart';

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar
      //  backgroundColor: Colors.green,
      body: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => Calender()));
        },
        onVerticalDragUpdate: (details) {
          int sensitivity = 8;
          if (details.delta.dy < -sensitivity) {
            SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                overlays: [SystemUiOverlay.bottom]);
          }
        },
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xffa6c0fe), Color(0xfff68084)])),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.height / 2.1,
                child: AnalogClock(
                  decoration: BoxDecoration(
                      border:
                          Border.all(width: 3.0, color: Colors.pink.shade100),
                      color: Colors.white,
                      shape: BoxShape.circle), // decoration
                  isLive: true,
                  hourHandColor: Colors.white,
                  minuteHandColor: Colors.white,
                  showSecondHand: true,
                  secondHandColor: Colors.green,
                  numberColor: Colors.white,
                  showNumbers: true,
                  textScaleFactor: 1.5,
                  showTicks: true,
                  useMilitaryTime: false,
                  showDigitalClock: true,
                  digitalClockColor: Colors.white,
                  datetime: DateTime.now(),
                ),
              ),
              Container(
                child: Center(
                  child: AnalogClock(
                    decoration: BoxDecoration(
                        border: Border.all(width: 3.0, color: Colors.teal),
                        color: Colors.black45,
                        shape: BoxShape.circle), // decoration
                    width: MediaQuery.of(context).size.height / 1.4,
                    isLive: true,
                    hourHandColor: Colors.white,
                    minuteHandColor: Colors.white,
                    showSecondHand: true,
                    secondHandColor: Colors.pink,
                    numberColor: Colors.white,
                    showNumbers: true,
                    textScaleFactor: 1.5,
                    showTicks: true,
                    useMilitaryTime: false,
                    showDigitalClock: true,
                    digitalClockColor: Colors.white,
                    datetime: DateTime.now(),
                  ), // analog clock
                ),
              ),
              Container(
                child: Center(
                  child: AnalogClock(
                    decoration: BoxDecoration(
                        border: Border.all(width: 3.0, color: Colors.white),
                        gradient: LinearGradient(
                            colors: [Color(0xfffccb90), Color(0xffd57eeb)]),
                        shape: BoxShape.circle), // decoration
                    width: MediaQuery.of(context).size.height / 1.9,
                    isLive: true,
                    hourHandColor: Colors.white,
                    minuteHandColor: Colors.yellow,
                    secondHandColor: Colors.black,
                    showSecondHand: true,
                    numberColor: Colors.black,
                    showNumbers: true,
                    textScaleFactor: 1.5,
                    showTicks: true,
                    //useMilitaryTime: true,
                    showDigitalClock: mounted,
                    digitalClockColor: Colors.black,
                    datetime: DateTime.now(),
                  ), // analog clock
                ),
              ),
            ],
          ),
        ),
      ), // center
    );
  }
}
