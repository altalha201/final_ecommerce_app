import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ui/screens/splash_screen.dart';
import 'ui/utils/application_colors.dart';

void main() {
  runApp(const CraftyBay());
}

class CraftyBay extends StatelessWidget {
  const CraftyBay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Crafty Bay",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: colorWhite,
          elevation: 1
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
            textStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
              fontSize: 18
            ),
          )
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(color: colorGray),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 4.0,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: colorPrimary, width: 2),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: colorPrimary, width: 2)
          )
        )
      ),
      home: const SplashScreen(),
    );
  }
}
