import 'package:final_ecommerce_app/data/models/product_models/products_by_remark_model.dart';
import 'package:final_ecommerce_app/data/services/network_caller.dart';
import 'package:get/get.dart';

class ProductsByRemarkController extends GetxController {
  bool _gettingPopularProducts = false,
  _gettingSpecialProducts = false,
  _gettingNewProducts = false;

  ProductsByRemarkModel _popularProductsModel = ProductsByRemarkModel();
  ProductsByRemarkModel _specialProductsModel = ProductsByRemarkModel();
  ProductsByRemarkModel _newProductsModel = ProductsByRemarkModel();

  bool get gettingPopularProducts => _gettingPopularProducts;
  bool get gettingSpecialProducts => _gettingSpecialProducts;
  bool get gettingNewProducts => _gettingNewProducts;
  ProductsByRemarkModel get popularProductsModel => _popularProductsModel;
  ProductsByRemarkModel get specialProductsModel => _specialProductsModel;
  ProductsByRemarkModel get newProductsModel => _newProductsModel;

  Future<bool> getPopularProducts() async {
    _gettingPopularProducts = true;
    update();
    final response = await NetworkCaller.getRequest(url: '/ListProductByRemark/popular');
    _gettingPopularProducts = false;
    if (response.isSuccess) {
      _popularProductsModel = ProductsByRemarkModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

  Future<bool> getSpecialProducts() async {
    _gettingSpecialProducts = true;
    update();
    final response = await NetworkCaller.getRequest(url: '/ListProductByRemark/special');
    _gettingSpecialProducts = false;
    if (response.isSuccess) {
      _specialProductsModel = ProductsByRemarkModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

  Future<bool> getNewProducts() async {
    _gettingNewProducts = true;
    update();
    final response = await NetworkCaller.getRequest(url: '/ListProductByRemark/new');
    _gettingNewProducts = false;
    if (response.isSuccess) {
      _newProductsModel = ProductsByRemarkModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}