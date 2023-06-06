import 'package:get/get.dart';

import '../../../data/models/brand_models/brand_list_model.dart';
import '../../../data/services/network_caller.dart';

class BrandListController extends GetxController {
  bool _getBrandsInProgress = false;
  BrandListModel _brandListModel = BrandListModel();
  
  bool get getBrandsInProgress => _getBrandsInProgress;
  
  BrandListModel get brandListModel => _brandListModel;
  
  Future<bool> getBrands() async {
    _getBrandsInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: '/BrandList');
    _getBrandsInProgress = false;
    if (response.isSuccess) {
      _brandListModel = BrandListModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}