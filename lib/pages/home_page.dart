import 'package:bmi_calculator/components/button2.dart';
import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'package:bmi_calculator/components/height_selector.dart';
import 'package:bmi_calculator/components/weight_selector.dart';
import 'package:bmi_calculator/pages/results_page.dart';
import 'package:bmi_calculator/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final BMIController bmiController = Get.put(BMIController());

 void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => SettingsPage()),
        );
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          PopupMenuButton<int>(
            onSelected: (item) => onSelected(context, item),
            icon: Icon(Icons.more_vert, color: Colors.white),
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                value: 0,
                child: Row(
                  children: [
                    Icon(Icons.settings),
                    SizedBox(width: 8),
                    Text('Settings'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 28,
                      color:Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "BMI Calculator",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color:  Theme.of(context).colorScheme.onSurface,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 5),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ShaderMask(
                            shaderCallback: (bounds) => LinearGradient(
                              colors: [Colors.amber, Colors.blue],
                              tileMode: TileMode.mirror,
                            ).createShader(bounds),
                            child: Text(
                              "Maintain your ideal weight for a healthier, more energetic, and confident life. Start your journey today with the BMI app.",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          WeightSelector(),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    HeightSelector(),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ButtonCheck(
                onPress: () {
                  bmiController.CalculatBMI();
                  Get.to(() => ResultPage());
                },
                icon: Icons.done,
                btnName: "Check",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
