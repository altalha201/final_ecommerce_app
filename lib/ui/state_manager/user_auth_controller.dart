import 'package:get/get.dart';

import '../../data/services/network_caller.dart';
import 'auth_controller.dart';

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
      await Get.find<AuthController>().saveToken(response.returnData['data']);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
