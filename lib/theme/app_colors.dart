import 'package:flutter/material.dart';

class AppColors {
  static const pinkLight = Color(0xFFF68989);
  static const red = Color(0xFFFE5150);
  static const textDark = Color(0xFF4A4A4A);
  static const fieldBg = Color(0xFFEEF3F5);
  static const grey = Color(0xFF9E9E9E);

  static const gradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [pinkLight, red],
  );
}