import 'package:get/get.dart';

import '../../../data/models/profile_data.dart';
import '../../../data/services/network_caller.dart';
import 'auth_controller.dart';

class UserProfileController extends GetxController {
  bool _getProfileDataInProgress = false;

  bool _profileCompleteInProgress = false;

  bool get getProfileInProgress => _getProfileDataInProgress;

  bool get profileCompleteInProgress => _profileCompleteInProgress;

  Future<bool> getProfileData() async {
    _getProfileDataInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: '/ReadProfile');
    _getProfileDataInProgress = false;
    if (response.isSuccess) {
      final ProfileModel profileModel =
          ProfileModel.fromJson(response.returnData);
      if (profileModel.profileData != null) {
        Get.find<AuthController>()
            .saveProfileData(profileModel.profileData!.first);
        update();
        return true;
      } else {
        update();
        return false;
      }
    } else {
      if (response.statusCode == 401) {
        getProfileData();
      }
      update();
      return false;
    }
  }

  Future<bool> completeProfile(Map<String, String> profileData) async {
    _profileCompleteInProgress = true;
    update();

    final response = await NetworkCaller.postRequest(
        url: "/CreateProfile", requestBody: profileData);
    _profileCompleteInProgress = false;

    if (response.isSuccess) {
      final ProfileModel profileModel =
          ProfileModel.fromJson(response.returnData);
      if (profileModel.profileData != null) {
        Get.find<AuthController>()
            .saveProfileData(profileModel.profileData!.first);
        update();
        return true;
      } else {
        update();
        return false;
      }
    } else {
      return false;
    }
  }
}
