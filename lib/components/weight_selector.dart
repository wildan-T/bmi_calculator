import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bmi_calculator/components/button1.dart';

class WeightSelector extends StatefulWidget {
  const WeightSelector({super.key});

  @override
  State<WeightSelector> createState() => _WeightSelectorState();
}

class _WeightSelectorState extends State<WeightSelector> {
  bool isEditing = false;
  late TextEditingController _textEditingController;
  final weight = 65.obs;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
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
        height: 275,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Weight (Kg)",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
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
                                  if (newWeight != null) {}
                                  setState(() {
                                    isEditing = false;
                                  });
                                },
                              ),
                            )
                          : Text(
                              "${weight.value}",
                              style: TextStyle(
                                fontSize: 90, // Kurangi jika masih overflow
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PrimaryButton(
                  onpress: () {},
                  icon: Icons.add,
                ),
                PrimaryButton(
                  onpress: () {},
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
