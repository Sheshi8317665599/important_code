import 'package:flutter/material.dart';
import 'package:vonc_website/constants/global.dart';
import 'package:vonc_website/router.dart';
import 'package:vonc_website/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => generateRoute(settings),
      title: 'V On C',
      theme: ThemeData(
        primaryColorDark: Colors.black87,
        primaryColorLight: Colors.black54,
        colorScheme: ColorScheme.light(
          primary: GlobalVariables.primaryColor,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
