import 'package:bmi_calculator/components/button2.dart';
import 'package:bmi_calculator/components/height_selector.dart';
import 'package:bmi_calculator/components/weight_selector.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
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
                      color: Colors.grey,
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
                      color: Colors.black,
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
                          const SizedBox(height: 64),
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
                onPress: () {},
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
