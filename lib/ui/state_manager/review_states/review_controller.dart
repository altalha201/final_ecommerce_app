import 'package:get/get.dart';

import '../../../data/models/review_models/review_model.dart';
import '../../../data/services/network_caller.dart';

class ReviewController extends GetxController {
  bool _gettingReviews = false;
  
  ReviewModel _readReviewsModel = ReviewModel();
  
  bool get gettingReviews => _gettingReviews;
  
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


}