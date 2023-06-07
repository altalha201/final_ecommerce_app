import 'package:get/get.dart';

import '../../../data/models/product_models/product_details_model.dart';
import '../../../data/services/network_caller.dart';

class ProductDetailsController extends GetxController {
  bool _gettingDetails = false;

  ProductDetailsModel _detailsModel = ProductDetailsModel();

  bool get gettingDetails => _gettingDetails;

  ProductDetailsModel get detailsModel => _detailsModel;

  Future<bool> getDetails(int productID) async {
    _gettingDetails = true;
    update();
    final response = await NetworkCaller.getRequest(url: '/ProductDetailsById/$productID');
    _gettingDetails = false;
    if (response.isSuccess) {
      _detailsModel = ProductDetailsModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}