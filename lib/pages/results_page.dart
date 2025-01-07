import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:bmi_calculator/components/button3.dart';
import 'package:bmi_calculator/controllers/bmi_controller.dart';

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
                      "Your BMI is",
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
                child: SizedBox(
                  child: Obx(
                    () => CircularPercentIndicator(
                      animationDuration: 1100,
                      footer: Text(
                        "${bmiController.BMIstatus.value}", // Deskripsi
                        style: TextStyle(
                            color: bmiController.colorStatus.value,
                            fontSize: 30,
                            height: 2,
                            fontWeight: FontWeight.bold),
                      ),
                      radius: 140,
                      lineWidth: 35,
                      animation: true,
                      circularStrokeCap: CircularStrokeCap.round,
                      percent: bmiController.tempBMI.value / 100,
                      center: Text(
                        "${bmiController.BMI.value}%",
                        style: TextStyle(
                            color: bmiController.colorStatus.value,
                            fontSize: 70,
                            fontWeight: FontWeight.bold),
                      ),
                      progressColor: bmiController.colorStatus.value,
                      backgroundColor:
                          bmiController.colorStatus.value.withOpacity(0.2),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black
                          .withOpacity(0.2), // Warna bayangan dengan kelegapan
                      spreadRadius:
                          2, // Menentukan seberapa jauh bayangan menyebar
                      blurRadius: 5, // Seberapa kabur bayangan
                      offset: Offset(2, 4), // Posisi bayangan (x, y)
                    ),
                  ],
                ),
                padding: EdgeInsets.all(10),
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your BMI is ${bmiController.BMI.value}%, which indicates your weight is in the ${bmiController.BMIstatus.value} category for adults of your height.",
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "A normal weight range for your height is: ${bmiController.recommendedWeightRange.value}.",
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Maintaining a healthy weight can help reduce the risk of chronic diseases associated with overweight and obesity.",
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
                btnName: "Let's Check Again",
              ),
            ],
          ),
        ),
      ),
    );
  }
}