import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bmi_calculator/config/theme.dart';
import 'package:bmi_calculator/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light, // Paksa mode terang
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      home: HomePage(),
    );
  }
}
