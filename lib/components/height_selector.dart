import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:bmi_calculator/controllers/bmi_controller.dart';

class HeightSelector extends StatelessWidget {
  HeightSelector({super.key});
  final BMIController bmiController = Get.put(BMIController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Height (Cm)",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Obx(
                () => SfSlider.vertical(
                  min: 0,
                  max: 260,
                  value: bmiController.height.value,
                  interval: 20,
                  showTicks: true,
                  showLabels: true,
                  enableTooltip: true,
                  minorTicksPerInterval: 5,
                  activeColor: Theme.of(context).colorScheme.primary,
                  inactiveColor:
                      Theme.of(context).colorScheme.primary.withOpacity(0.3),
                  onChanged: (dynamic value) {
                    bmiController.height.value = value;
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
