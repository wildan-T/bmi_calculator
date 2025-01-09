import 'package:bmi_calculator/config/language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bmi_calculator/config/theme.dart';
import 'package:bmi_calculator/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final savedLanguage = await _loadLanguage();

  runApp(MyApp(savedLanguage));
}

Future<String> _loadLanguage() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('selected_language') ??
      'English'; // default ke English
}

class MyApp extends StatelessWidget {
  final String language;

  const MyApp(this.language, {super.key});

  @override
  Widget build(BuildContext context) {
    final languageCode = language == 'English' ? 'gb' : 'id';

    return GetMaterialApp(
      locale: Locale(languageCode),
      fallbackLocale: Locale('gb', 'US'),
      translations: Languages(),

      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light, // Paksa mode terang
      debugShowCheckedModeBanner: false,
      title: 'bmiCalculator'.tr,
      home: HomePage(),
    );
  }
}
