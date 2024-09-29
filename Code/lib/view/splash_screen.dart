import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:vonc_website/view/auth/authscreen.dart';
import 'package:vonc_website/view/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash:
            "assets/videos/V O n C Logo video.gif",
        splashIconSize: 2000.0,
        centered: true,
        nextScreen: const HomeScreen(),
        backgroundColor: Colors.black,
        duration: 11000,
      ),
    );
  }
}
