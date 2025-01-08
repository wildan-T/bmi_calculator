import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bmi_calculator/components/button1.dart';
import 'package:bmi_calculator/controllers/bmi_controller.dart';

class WeightSelector extends StatefulWidget {
  const WeightSelector({super.key});

  @override
  State<WeightSelector> createState() => _WeightSelectorState();
}

class _WeightSelectorState extends State<WeightSelector> {
  final BMIController bmiController = Get.put(BMIController());
  bool isEditing = false;
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController =
        TextEditingController(text: bmiController.weight.value.toString());
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primaryContainer,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(2, 4),
            ),
          ],
        ),
        height: 275,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "weight".tr,
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,  
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Obx(
                    () => GestureDetector(
                      onTap: () {
                        setState(() {
                          isEditing = true;
                        });
                      },
                      child: isEditing
                          ? SizedBox(
                              width: 100,
                              child: TextField(
                                controller: _textEditingController,
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                  fontSize: 70, // Kurangi ukuran font
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                                onSubmitted: (value) {
                                  final newWeight = int.tryParse(value);
                                  if (newWeight != null) {
                                    bmiController.weight.value = newWeight;
                                  }
                                  setState(() {
                                    isEditing = false;
                                  });
                                },
                              ),
                            )
                          : Text(
                              "${bmiController.weight.value}",
                              style: TextStyle(
                                fontSize: 90, // Kurangi jika masih overflow
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                    ),
                  ),
                ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PrimaryButton(
                  onpress: () {
                    bmiController.weight.value++;
                  },
                  icon: Icons.add,
                ),
                PrimaryButton(
                  onpress: () {
                    if (bmiController.weight.value > 0) {
                      bmiController.weight.value--;
                    } else {
                      Get.snackbar(
                        "invalid".tr,
                        "remaks".tr,
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    }
                  },
                  icon: Icons.remove,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
