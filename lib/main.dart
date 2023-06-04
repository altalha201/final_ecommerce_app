import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'ui/screens/splash_screen.dart';
import 'ui/state_manager/auth_controller.dart';
import 'ui/state_manager/bottom_navigation_bar_controller.dart';
import 'ui/state_manager/category_controller.dart';
import 'ui/state_manager/home_controller.dart';
import 'ui/state_manager/otp_expire_timer_controller.dart';
import 'ui/state_manager/user_auth_controller.dart';
import 'ui/state_manager/user_profile_controller.dart';
import 'ui/utils/theme_data.dart';

void main() async {
  await GetStorage.init();
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

class GetXBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavigationBarController());
    Get.put(UserAuthController());
    Get.put(OTPExpireTimerController());
    Get.put(AuthController());
    Get.put(UserProfileController());
    Get.put(HomeController());
    Get.put(CategoryController());
  }
}
