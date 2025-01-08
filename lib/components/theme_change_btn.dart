import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:bmi_calculator/controllers/theme_controller.dart';

class ThemeChangeBtn extends StatelessWidget {
  const ThemeChangeBtn({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = Get.put(ThemeController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black
                    .withOpacity(0.2), // Warna bayangan dengan kelegapan
                spreadRadius: 2, // Menentukan seberapa jauh bayangan menyebar
                blurRadius: 5, // Seberapa kabur bayangan
                offset: Offset(2, 4), // Posisi bayangan (x, y)
              ),
            ],
          ),
          child: InkWell(
            onTap: () {
              themeController.changeTheme();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  "assets/images/light2.svg",
                  colorFilter: ColorFilter.mode(
                    themeController.isDark.value
                        ? Theme.of(context).colorScheme.onSecondaryContainer
                        : Theme.of(context).colorScheme.primary,
                    BlendMode.srcIn, // Mode blending untuk mengganti warna SVG
                  ),
                  height: 30,
                ),
                const SizedBox(
                  width: 25,
                ),
                SvgPicture.asset(
                  "assets/images/dark4.svg",
                  colorFilter: ColorFilter.mode(
                    themeController.isDark.value
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.onSecondaryContainer,
                    BlendMode.srcIn, // Mode blending untuk mengganti warna SVG
                  ),
                  height: 30,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
