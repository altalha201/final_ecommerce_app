import 'package:get/get.dart';

import '../../../data/models/product_models/products_by_brand_model.dart';
import '../../../data/models/product_models/products_by_category_model.dart';
import '../../../data/services/network_caller.dart';

class ProductListController extends GetxController {
  bool _gettingProductList = false;

  bool get gettingProductList => _gettingProductList;

  ProductsByCategoryModel _productsByCategoryModel = ProductsByCategoryModel();
  ProductsByBrandModel _productsByBrandModel = ProductsByBrandModel();

  ProductsByCategoryModel get productsByCategoryModel => _productsByCategoryModel;
  ProductsByBrandModel get productsByBrandModel => _productsByBrandModel;
  
  Future<bool> getProductsByCategory({required int categoryId}) async {
    _gettingProductList = true;
    update();
    final response = await NetworkCaller.getRequest(url: '/ListProductByCategory/$categoryId');
    _gettingProductList = false;
    if (response.isSuccess) {
      _productsByCategoryModel = ProductsByCategoryModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

  Future<bool> getProductsByBrand({required int brandId}) async {
    _gettingProductList = true;
    update();
    final response = await NetworkCaller.getRequest(url: '/ListProductByBrand/$brandId');
    _gettingProductList = false;
    if (response.isSuccess) {
      _productsByBrandModel = ProductsByBrandModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}