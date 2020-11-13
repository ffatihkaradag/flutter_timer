import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool get _isTimerActive => (_timer != null && _timer.isActive);

  Timer _timer;
  int seconds = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedContainer(
          duration: const Duration(microseconds: 200),
          color: _isTimerActive
              ? const Color(0xFF264653)
              : const Color(0xFFe63946),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Elapsed Time',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  '$seconds',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(_isTimerActive ? Icons.stop : Icons.play_arrow),
        onPressed: () {
          if (_isTimerActive) {
            setState(() {
              _timer.cancel();
              seconds = 0;
            });
          } else {
            _timer = Timer.periodic(Duration(seconds: 1), (timer) {
              setState(() {
                seconds++;
              });
            });
          }
        },
      ),
    );
  }
}
