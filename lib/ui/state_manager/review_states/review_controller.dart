import 'package:get/get.dart';

import '../../../data/models/review_models/review_model.dart';
import '../../../data/services/network_caller.dart';
import '../user_states/cache_controller.dart';

class ReviewController extends GetxController {
  bool _gettingReviews = false, _creatingReviews = false;
  
  ReviewModel _readReviewsModel = ReviewModel();
  
  bool get gettingReviews => _gettingReviews;
  bool get creatingReviews => _creatingReviews;
  
  ReviewModel get readReviewsModel => _readReviewsModel;
  
  Future<bool> getReviewsByID(int productID) async {
    _gettingReviews = true;
    update();
    final response = await NetworkCaller.getRequest(url: '/ListReviewByProduct/$productID');
    _gettingReviews = false;
    if (response.isSuccess) {
      _readReviewsModel = ReviewModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

  Future<bool> createReview(int productID, String description) async {
    _creatingReviews = true;
    update();
    final response = await NetworkCaller.postRequest(
        url: '/CreateProductReview',
        requestBody: {
          "description" : description,
          "product_id" : productID,
        }
    );
    _creatingReviews = false;
    if (response.isSuccess) {
      update();
      return true;
    } else if (response.statusCode == 401) {
      Get.find<CacheController>().logout();
      update();
      return false;
    } else {
      update();
      return false;
    }
  }
}