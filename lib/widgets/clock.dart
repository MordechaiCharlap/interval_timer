import 'package:flutter/material.dart';
import 'dart:async';

class Clock extends StatefulWidget {
  final bool isRunning;
  const Clock({super.key, required this.isRunning});

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  int seconds = 0;
  late Timer _timer;

  String formatTime(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = seconds % 60;

    String hoursStr = (hours % 24).toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = remainingSeconds.toString().padLeft(2, '0');

    return '$hoursStr:$minutesStr:$secondsStr';
  }

  @override
  void initState() {
    super.initState();
    if (widget.isRunning) {
      startCounting();
    }
  }

  @override
  void didUpdateWidget(covariant Clock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isRunning && !oldWidget.isRunning) {
      startCounting();
    } else if (!widget.isRunning && oldWidget.isRunning) {
      stopCounting();
    }
  }

  void startCounting() {
    const duration = Duration(seconds: 1);
    _timer = Timer.periodic(duration, (timer) {
      setState(() {
        seconds++;
      });
    });
  }

  void stopCounting() {
    setState(() {
      seconds = 0;
      _timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime = formatTime(seconds);

    return Text(
      formattedTime,
      style: const TextStyle(fontSize: 48),
    );
  }
}
