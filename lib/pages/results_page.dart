import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:bmi_calculator/components/button3.dart';
import 'package:bmi_calculator/controllers/bmi_controller.dart';
import 'dart:math';

class ResultPage extends StatelessWidget {
  ResultPage({super.key});
  final BMIController bmiController = Get.put(BMIController());

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
            children: [
              Row(
                children: [
                  Obx(
                    () => Text(
                      "title".tr,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: bmiController.colorStatus.value,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Container(
                height: 340,
                child: Obx(
                  () {
                    // Membatasi nilai persen agar tidak melebihi 1.0
                    double percent = min(bmiController.tempBMI.value / 35, 1.0);
                    return CircularPercentIndicator(
                      animationDuration: 1100,
                      footer: Text(
                        bmiController.BMIstatus.value, // Deskripsi
                        style: TextStyle(
                          color: bmiController.colorStatus.value,
                          fontSize: 23,
                          height: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      radius: 140,
                      lineWidth: 35,
                      animation: true,
                      circularStrokeCap: CircularStrokeCap.round,
                      percent: percent,
                      center: Text(
                        bmiController.BMI.value,
                        style: TextStyle(
                          color: bmiController.colorStatus.value,
                          fontSize: 70,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      progressColor: bmiController.colorStatus.value,
                      backgroundColor:
                          bmiController.colorStatus.value.withOpacity(0.2),
                    );
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black
                          .withOpacity(0.2), // Shadow color and opacity
                      spreadRadius: 2, // Spread radius of the shadow
                      blurRadius: 5, // Blur radius
                      offset: Offset(2, 4), // Position of the shadow
                    ),
                  ],
                ),
                padding: EdgeInsets.all(10),
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "result1".tr,
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        "${bmiController.BMIstatus.value}",
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "result2".tr,
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        "${bmiController.recommendedWeightRange.value}",
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "result3".tr,
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              MyRactButton(
                onPress: () {
                  Get.back();
                },
                icon: Icons.arrow_back_ios_new_outlined,
                btnName: "cek2".tr,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
