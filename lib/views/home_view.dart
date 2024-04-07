// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeView extends StatelessWidget {
  // todo
  final List<Map<String, String>> prayerTimes = [
    {'name': 'Fajr', 'time': '4:17 AM'},
    {'name': 'Dhuhr', 'time': '12:05 PM'},
    {'name': 'Asr', 'time': '3:40 PM'},
    {'name': 'Maghrib', 'time': '6:28 PM'},
    {'name': 'Isha', 'time': '8:00 PM'},
  ];
  final String currentPrayer;
  final String currentTime = DateTime.now().toString().substring(11, 19);

  HomeView({
    Key? key,
  })  : currentPrayer = _getCurrentPrayer(),
        super(key: key);

  static String _getCurrentPrayer() {
    final DateTime now = DateTime.now();
    if (_isSameTime(now, TimeOfDay(hour: 5, minute: 0))) {
      return 'Fajr';
    } else if (_isSameTime(now, TimeOfDay(hour: 12, minute: 0))) {
      return 'Dhuhr';
    } else if (_isSameTime(now, TimeOfDay(hour: 15, minute: 0))) {
      return 'Asr';
    } else if (_isSameTime(now, TimeOfDay(hour: 18, minute: 0))) {
      return 'Maghrib';
    } else if (_isSameTime(now, TimeOfDay(hour: 20, minute: 0))) {
      return 'Isha';
    } else {
      return 'No prayer at this time';
    }
  }

  static bool _isSameTime(DateTime dateTime, TimeOfDay timeOfDay) {
    return dateTime.hour == timeOfDay.hour &&
        dateTime.minute == timeOfDay.minute;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/pexels-francesco-ungaro-2325271.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 50.0,
              right: 50.0,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Text(
                  currentTime,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  currentPrayer,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: prayerTimes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                          title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${prayerTimes[index]['name']} ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            ' ${prayerTimes[index]['time']}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
