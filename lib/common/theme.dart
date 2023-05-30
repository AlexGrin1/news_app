import 'package:news_app/imports.dart';

import 'package:flutter/material.dart';

NewsAppTheme newsAppTheme = NewsAppTheme();

class NewsAppTheme {
  AppTypography typography = AppTypography();
  AppColors appColors = AppColors();
}

class AppColors {
  Color highlighting = const Color.fromARGB(255, 0, 202, 192);
  Color light = const Color(0xffffffff);
  Color dark = const Color.fromARGB(255, 48, 48, 48);
  Color background = const Color.fromARGB(255, 65, 65, 65);
}

class AppTypography {
  TextStyle regular24 = const TextStyle(
    color: Colors.white,
    fontFamily: "Roboto-Regular",
    fontSize: 24.0,
  );
  TextStyle regular14 = const TextStyle(
    color: Colors.white,
    fontFamily: "Roboto-Regular",
    fontSize: 14,
  );
  TextStyle semibold16 = const TextStyle(
    color: Colors.white,
    fontFamily: "Roboto-Bold",
    fontSize: 16,
  );
}
