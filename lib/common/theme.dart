import 'package:news_app/imports.dart';

class NewsAppTheme {
  final AppTypography typography = AppTypography();
  final AppColors appColors = AppColors();
}

class AppColors {
  Color highlighting = const Color.fromARGB(255, 0, 202, 192);
  Color light = const Color(0xffffffff);
  Color lightWithOpacity05 = const Color(0xffffffff).withOpacity(0.5);
  Color dark = const Color.fromARGB(255, 48, 48, 48);
  Color background = const Color.fromARGB(255, 65, 65, 65);
}

class AppTypography {
  TextStyle regular24 = const TextStyle(
    color: Color(0xffffffff),
    fontFamily: "Roboto-Regular",
    fontSize: 24.0,
  );
  TextStyle regular14 = const TextStyle(
    color: Color(0xffffffff),
    fontFamily: "Roboto-Regular",
    fontSize: 14,
  );
  TextStyle semibold16 = const TextStyle(
    color: Color(0xffffffff),
    fontFamily: "Roboto-Bold",
    fontSize: 16,
  );
  TextStyle newsTitle = const TextStyle(
    color: Color(0xffffffff),
    fontFamily: "Roboto-Medium",
    fontSize: 16.0,
  );
  TextStyle newsDesciption = TextStyle(
    color: const Color(0xffffffff).withOpacity(0.5),
    fontFamily: "Roboto-Regular",
    fontSize: 14.0,
  );
}
