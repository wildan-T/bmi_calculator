import 'package:flutter/material.dart';
import 'package:bmi_calculator/config/colors.dart';

var lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme.light(
    surface: LBgColor,
    primary: LPrimaryColor,
    onSurface: LFontColor,
    primaryContainer: LDivColor,
    onPrimaryContainer: LFontColor,
    onSecondaryContainer: LLabelColor,
  ),
);
var darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme.dark(
    surface: DBgColor,
    primary: DPrimaryColor,
    onSurface: DFontColor,
    primaryContainer: DDivColor,
    onPrimaryContainer: DFontColor,
    onSecondaryContainer: DLabelColor,
  ),
);
