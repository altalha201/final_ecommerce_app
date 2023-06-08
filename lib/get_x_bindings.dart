import 'package:get/get.dart';

import 'ui/state_manager/home_slider_controller.dart';
import 'ui/state_manager/list_states/brand_list_controller.dart';
import 'ui/state_manager/list_states/category_list_controller.dart';
import 'ui/state_manager/product_states/product_details_controller.dart';
import 'ui/state_manager/product_states/product_list_controller.dart';
import 'ui/state_manager/product_states/products_by_remark_controller.dart';
import 'ui/state_manager/review_states/review_controller.dart';
import 'ui/state_manager/ui_states/bottom_navigation_bar_controller.dart';
import 'ui/state_manager/ui_states/otp_expire_timer_controller.dart';
import 'ui/state_manager/user_states/cache_controller.dart';
import 'ui/state_manager/user_states/user_auth_controller.dart';
import 'ui/state_manager/user_states/user_profile_controller.dart';

class GetXBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavigationBarController());
    Get.put(UserAuthController());
    Get.put(OTPExpireTimerController());
    Get.put(CacheController());
    Get.put(UserProfileController());
    Get.put(HomeSliderController());
    Get.put(CategoryListController());
    Get.put(ProductListController());
    Get.put(BrandListController());
    Get.put(ProductsByRemarkController());
    Get.put(ProductDetailsController());
    Get.put(ReviewController());
  }
}