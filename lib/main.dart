import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'get_x_bindings.dart';
import 'ui/screens/splash_screen.dart';
import 'ui/utils/theme_data.dart';

void main() async {
  runApp(const CraftyBay());
}

class CraftyBay extends StatelessWidget {
  const CraftyBay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Crafty Bay",
      debugShowCheckedModeBanner: false,
      theme: appThemeData(),
      home: const SplashScreen(),
      initialBinding: GetXBindings(),
    );
  }
}
