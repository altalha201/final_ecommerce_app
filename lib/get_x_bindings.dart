import 'package:get/get.dart';

import 'ui/state_manager/auth_controller.dart';
import 'ui/state_manager/bottom_navigation_bar_controller.dart';
import 'ui/state_manager/category_controller.dart';
import 'ui/state_manager/home_controller.dart';
import 'ui/state_manager/otp_expire_timer_controller.dart';
import 'ui/state_manager/product_list_controller.dart';
import 'ui/state_manager/user_auth_controller.dart';
import 'ui/state_manager/user_profile_controller.dart';

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
    Get.put(ProductListController());
  }
}