import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:bmi_calculator/controllers/theme_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class LanguageService {
  static const String _languageKey = 'selected_language';

  static Future<void> saveLanguage(String language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, language);
  }

  static Future<String> loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_languageKey) ?? 'English';
  }
}

class _SettingsPageState extends State<SettingsPage> {
  final ThemeController themeController = Get.put(ThemeController());
  RxString _language = 'English'.obs;

  @override
  void initState() {
    super.initState();
    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    final savedLanguage = await LanguageService.loadLanguage();
    setState(() {
      _language.value = savedLanguage;
    });
    final languageCode = savedLanguage == 'English' ? 'gb' : 'id';
    if (Get.locale?.languageCode != languageCode) {
      Get.updateLocale(Locale(languageCode));
    }
  }

  void _onLanguageChanged(String language, String code) async {
    setState(() {
      _language.value = language;
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_language', language);
    Get.updateLocale(Locale(code));
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'selectLanguage'.tr,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 16),
                _buildLanguageItem(
                    'assets/images/flags/gb.svg', 'English', 'gb'),
                _buildLanguageItem(
                    'assets/images/flags/id.svg', 'Indonesia', 'id'),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLanguageItem(String flagPath, String name, String code) {
    return GestureDetector(
      onTap: () {
        _onLanguageChanged(name, code);
        Navigator.pop(context);
      },
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                // Menggunakan SvgPicture untuk SVG
                flagPath,
                width: 24,
                height: 24,
              ),
              SizedBox(width: 12),
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(2, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text(
                      "settings1".tr,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                    SizedBox(height: 5),
                    Divider(
                      color: Colors.grey, // Warna garis
                      thickness: 1, // Ketebalan garis
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'language'.tr,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _showLanguageDialog();
                          },
                          child: Container(
                            height: 23,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                            ),
                            alignment: Alignment.center,
                            child: Obx(() => Text(
                                  _language.value,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.grey.shade500,
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'darkMode'.tr,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Obx(() => Transform.scale(
                              scale: 0.7,
                              child: Switch(
                                activeTrackColor: Colors.grey.shade300,
                                activeColor: const Color(0xff309CFF),
                                value: themeController.isDark.value,
                                onChanged: (val) {
                                  themeController.changeTheme();
                                },
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
