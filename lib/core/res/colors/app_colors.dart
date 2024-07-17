import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static MaterialColor get primaryColor =>
      createMaterialColor(const Color(0xFF00576C));

  static MaterialColor get secondaryColor =>
      createMaterialColor(const Color(0xFFFF6D4E));

  static MaterialColor get tertiaryColor =>
      createMaterialColor(const Color(0xFF008482));

  static MaterialColor get navColor =>
      createMaterialColor(const Color(0xFFFFFFFF));

  static MaterialColor get darkGrey =>
      createMaterialColor(const Color(0xFF7A7A7A));

  static MaterialColor get grey => createMaterialColor(const Color(0xFF9F9F9F));

  static MaterialColor get bgColor =>
      createMaterialColor(const Color(0xFFF5F5F5));

  static MaterialColor get greyLight =>
      createMaterialColor(const Color(0xFF949494));

  static MaterialColor get greyLighter =>
      createMaterialColor(const Color(0xFFDBDBDB));

  static MaterialColor get summaryGrey =>
      createMaterialColor(const Color(0xFFECECEC));

  static MaterialColor get caption =>
      createMaterialColor(const Color(0xFF727272));
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }

  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }

  return MaterialColor(color.value, swatch);
}

extension MaterialColorsExtension on MaterialColor {
  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lighten([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}

extension ColorsExtension on Color {
  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lighten([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}
