import 'package:get/get.dart';

import '../../data/models/category_model.dart';
import '../../data/services/network_caller.dart';

class CategoryController extends GetxController {
  bool _getCategoriesInProgress = false;
  CategoryModel _categoryModel = CategoryModel();

  bool get getCategoriesInProgress => _getCategoriesInProgress;

  CategoryModel get categoryModel => _categoryModel;

  Future<bool> getCategories() async {
    _getCategoriesInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: '/CategoryList');
    _getCategoriesInProgress = false;
    if(response.isSuccess) {
      _categoryModel = CategoryModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

}