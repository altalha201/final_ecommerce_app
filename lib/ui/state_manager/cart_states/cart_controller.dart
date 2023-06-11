import 'package:get/get.dart';

import '../../../data/models/cart_models/cart_list_model.dart';
import '../../../data/services/network_caller.dart';
import '../ui_states/home_nav_controller.dart';
import '../user_states/cache_controller.dart';

class CartController extends GetxController {
  bool _gettingCartItems = false;

  CartListModel _cartListModel = CartListModel();

  bool get gettingCartItems => _gettingCartItems;
  CartListModel get cartListModel => _cartListModel;
  
  Future<bool> getCartList() async {
    _gettingCartItems = true;
    update();
    final response = await NetworkCaller.getRequest(url: "/CartList");
    _gettingCartItems = false;
    if (response.isSuccess) {
      _cartListModel = CartListModel.fromJson(response.returnData);
      update();
      return true;
    } else if (response.statusCode == 401) {
      Get.find<HomeNavController>().backToHome();
      Get.find<CacheController>().logout();
      update();
      return false;
    } else {
      update();
      return false;
    }
  }
}