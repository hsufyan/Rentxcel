import 'package:flutter/material.dart';
import 'package:rentexl/onboarding/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primaryColor: Color(0x1F2326),
        useMaterial3: true,
      ),
      home: OnboardingScreen()
    );
  }
}

 