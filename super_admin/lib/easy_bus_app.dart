import 'package:flutter/material.dart';
import 'package:super_admin/core/presentation/screens/splash_screen.dart';


class EasyBusApp extends StatelessWidget {
  const EasyBusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Easy Bus Booking",
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
    );
  }
}
