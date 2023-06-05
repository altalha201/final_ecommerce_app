import 'package:get/get.dart';

import '../../data/models/category_models/category_list_model.dart';
import '../../data/services/network_caller.dart';

class CategoryController extends GetxController {
  bool _getCategoriesInProgress = false;
  CategoryListModel _categoryListModel = CategoryListModel();

  bool get getCategoriesInProgress => _getCategoriesInProgress;

  CategoryListModel get categoryListModel => _categoryListModel;

  Future<bool> getCategories() async {
    _getCategoriesInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: '/CategoryList');
    _getCategoriesInProgress = false;
    if(response.isSuccess) {
      _categoryListModel = CategoryListModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

}