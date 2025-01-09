import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BMIController extends GetxController {
  RxInt weight = 12.obs;
  RxDouble height = 100.0.obs;
  RxString BMI = "".obs;
  RxDouble tempBMI = 0.0.obs;
  RxString BMIstatus = "".obs;
  Rx<Color> colorStatus = Color(0xff246AFE).obs;
  RxString recommendedWeightRange = "".obs; //Rekomendasi berat badan ideal

  void CalculatBMI() {
    var Hmeter = height / 100;
    tempBMI.value = weight / (Hmeter * Hmeter);
    BMI.value = tempBMI.toStringAsFixed(1);
    findStatus();
    calculateRecommendedWeight();
    print(BMI);
  }

  void calculateRecommendedWeight() {
    // Ukuran rentang BMI normal
    double minBMI = 18.5;
    double maxBMI = 24.9;
    var Hmeter = height / 100;

    // Hitung rekomendasi berat badan yang disaranin
    double minWeight = minBMI * (Hmeter * Hmeter);
    double maxWeight = maxBMI * (Hmeter * Hmeter);

    // Update nilai rentang berat badan
    recommendedWeightRange.value =
        "${minWeight.toStringAsFixed(1)} kg - ${maxWeight.toStringAsFixed(1)} kg";
  }

  void findStatus() {
    if (tempBMI.value < 18.5) {
      BMIstatus.value = "underweight".tr;
      // colorStatus.value = Color(0xffFFB700);
      colorStatus.value = Color(0xffFFA726);
    } else if (tempBMI.value >= 18.5 && tempBMI.value <= 24.9) {
      BMIstatus.value = "normal".tr;
      // colorStatus.value = Color(0xff00CA39);
      colorStatus.value = Color(0xff66BB6A);
    } //18.5 sampai 24.9
    else if (tempBMI.value >= 25.0 && tempBMI.value <= 29.9) {
      BMIstatus.value = "overweight".tr;
      // colorStatus.value = Color(0xffFEB200);
      colorStatus.value = Color(0xffFFEE58);
    } //25.0 sampai 29.9
    else if (tempBMI.value >= 30.0 && tempBMI.value <= 34.9) {
      BMIstatus.value = "obese".tr;
      // colorStatus.value = Color(0xffBF6300);
      colorStatus.value = Color(0xffEF5350);
    } //30.5 sampai 34.9
    else if (tempBMI.value >= 35.0) {
      BMIstatus.value = "extremelyObese".tr;
      // colorStatus.value = Color(0xffC90000);
      colorStatus.value = Color(0xffB71C1C);
    }
  }
}
