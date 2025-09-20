import 'package:flutter/material.dart';
import 'dart:async';

import 'package:super_admin/core/presentation/screens/role_selection_screen.dart';
import 'package:super_admin/features/auth/auth_module.dart';
import 'package:super_admin/features/roleselection/presentation/screens/roleselection_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  double _progressValue = 0.0;

  @override
  void initState() {
    super.initState();
    _startProgressSimulation();
  }

  void _startProgressSimulation() {
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {
        if (_progressValue < 1.0) {
          _progressValue += 0.01; // Increment progress
        } else {
          timer.cancel();
          // Navigate to main screen after splash is complete
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => RoleselectionScreen()), // Replace MainScreen with your actual main screen
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          // Optional: Add a background image or color
          // image: DecorationImage(
          //   image: AssetImage('assets/background_image.png'),
          //   fit: BoxFit.cover,
          // ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Your splash image
            Image.asset(
              'assets/icons/icon.png', // Replace with your image path
              height: (MediaQuery.of(context).size.height - 10), // Sets height to full screen height
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill
            ), // Spacing between image and progress bar
            Align(
              alignment: Alignment.bottomCenter,
              child: LinearProgressIndicator(
                  value: _progressValue,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
