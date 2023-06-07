import 'package:get/get.dart';

import '../../data/models/home_slider_model.dart';
import '../../data/services/network_caller.dart';

class HomeSliderController extends GetxController {
  bool _getSliderInProgress = false;
  HomeSliderModel _model = HomeSliderModel();

  bool get getSliderInProgress => _getSliderInProgress;
  HomeSliderModel get homeSliderData => _model;

  Future<bool> getCarouselData() async {
    _getSliderInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: '/ListProductSlider');
    _getSliderInProgress = false;
    if (response.isSuccess) {
      _model = HomeSliderModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}