import 'package:get/get.dart';

import 'ui/state_manager/list_states/brand_list_controller.dart';
import 'ui/state_manager/user_states/auth_controller.dart';
import 'ui/state_manager/bottom_navigation_bar_controller.dart';
import 'ui/state_manager/list_states/category_list_controller.dart';
import 'ui/state_manager/home_controller.dart';
import 'ui/state_manager/otp_expire_timer_controller.dart';
import 'ui/state_manager/product_states/product_list_controller.dart';
import 'ui/state_manager/user_states/user_auth_controller.dart';
import 'ui/state_manager/user_states/user_profile_controller.dart';

class GetXBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavigationBarController());
    Get.put(UserAuthController());
    Get.put(OTPExpireTimerController());
    Get.put(AuthController());
    Get.put(UserProfileController());
    Get.put(HomeController());
    Get.put(CategoryListController());
    Get.put(ProductListController());
    Get.put(BrandListController());
  }
}