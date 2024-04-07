import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PrayerScreen extends StatefulWidget {
  @override
  _PrayerScreenState createState() => _PrayerScreenState();
}

class _PrayerScreenState extends State<PrayerScreen> {
  String _currentPrayer = '';
  String _currentTime = '';

  @override
  void initState() {
    super.initState();
    _updatePrayerTime();
    _updateClock();
  }

  void _updatePrayerTime() {
    // TODO: Implement your logic to fetch and update the prayer times here
    // You can use an API or calculate the times based on a specific method
    // Store the current prayer name in the _currentPrayer variable
  }

  void _updateClock() {
    setState(() {
      _currentTime = DateFormat('h:mm a').format(DateTime.now());
    });

    // Update the clock every minute
    Future.delayed(Duration(minutes: 1), () {
      _updateClock();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prayer Times'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _currentTime,
              style: TextStyle(fontSize: 48),
            ),
            SizedBox(height: 16),
            Text(
              _currentPrayer,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
