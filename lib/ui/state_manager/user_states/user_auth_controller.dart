import 'package:get/get.dart';

import '../../../data/services/network_caller.dart';
import 'cache_controller.dart';
import 'user_profile_controller.dart';

class UserAuthController extends GetxController {
  bool _emailVerificationInProgress = false;
  bool _pinVerificationInProgress = false;

  bool get emailVerificationInProgress => _emailVerificationInProgress;
  
  bool get pinVerificationInProgress => _pinVerificationInProgress;

  Future<bool> emailVerification(String email) async {
    _emailVerificationInProgress = true;
    update();

    final response = await NetworkCaller.getRequest(url: '/UserLogin/$email');
    _emailVerificationInProgress = false;

    if (response.isSuccess) {
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
  
  Future<bool> pinVerification(String email, String otp) async {
    _pinVerificationInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: '/VerifyLogin/$email/$otp');
    _pinVerificationInProgress = false;
    if (response.isSuccess) {
      await Get.find<CacheController>().saveToken(response.returnData["data"]);
      await Get.find<UserProfileController>().getProfileData(true);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
