import 'package:flutter/material.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TimeOfDay _time = TimeOfDay.now();
  bool iosStyle = true;

  void onTimeChanged(Time newTime) {
    setState(() {
      _time = newTime;
      print(_time);
      // time = DateTime.now() as Time;
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                showPicker(
                  context: context,
                  value: Time(hour: _time.hour, minute: _time.minute),
                  elevation: 1,
                  height: 390,
                  iosStylePicker: iosStyle,
                  // displayHeader: false,
                  isOnChangeValueMode: false,
                  minuteInterval: TimePickerInterval.ONE,
                  sunAsset: Image(
                      image: AssetImage("assets/image/sun.jpg"),
                      fit: BoxFit.cover),
                  moonAsset: Image(
                      image:
                          AssetImage("assets/image/moon-removebg-preview.png"),
                      fit: BoxFit.fill),
                  blurredBackground: true,
                  //  minuteInterval: TimePickerInterval.FIVE,
                  sunrise: TimeOfDay(hour: 6, minute: 0), // optional
                  sunset: TimeOfDay(hour: 18, minute: 0), // optional
                  duskSpanInMinutes: 120, // optional
                  onChange: (TimeOfDay time) {
                    setState(() {
                      _time = time;
                    });
                  },
                ),
              );
            },
            child: Center(
              child: Text(
                "Open time picker",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          Switch(
            value: iosStyle,
            onChanged: (newVal) {
              setState(() {
                iosStyle = newVal;
              });
            },
          ),
        ],
      ),
    );
  }
}
