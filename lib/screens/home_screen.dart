import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
// import '../widgets/clock.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isRunning = false;

  void startTimer() {
    setState(() {
      isRunning = true;
    });
    // Add your timer logic here
  }

  void stopTimer() {
    setState(() {
      isRunning = false;
    });
    // Add your stop timer logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interval Timer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Clock(isRunning: isRunning),
            const SizedBox(height: 24),
            CustomButton(
              onPressed: isRunning ? stopTimer : startTimer,
              icon: isRunning ? Icons.stop : Icons.play_arrow,
              label: isRunning ? 'Stop' : 'Play',
            ),
          ],
        ),
      ),
    );
  }
}
