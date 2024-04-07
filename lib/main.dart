import 'package:flutter/material.dart';
import 'package:task8/views/home_view.dart';
import 'package:task8/views/prayer_view.dart';

void main() {
  runApp(const PrayerTime());
}

class PrayerTime extends StatelessWidget {
  const PrayerTime({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
