import 'package:news_app/imports.dart';

final ThemeData newsAppTheme = ThemeData(
  fontFamily: 'Roboto',
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
  ),
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
      .copyWith(secondary: Colors.orange),
);
