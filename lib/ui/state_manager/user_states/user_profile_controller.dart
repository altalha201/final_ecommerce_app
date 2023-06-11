import 'package:get/get.dart';

import '../../../data/models/profile_models/user_profile_model.dart';
import '../../../data/services/network_caller.dart';
import '../../screens/complete_profile_screen.dart';
import 'cache_controller.dart';

class UserProfileController extends GetxController {
  bool _gettingUserProfile = false, _profileCompleteInProgress = false;

  UserProfileModel _profileModel = UserProfileModel();

  bool get getProfileInProgress => _gettingUserProfile;
  bool get profileCompleteInProgress => _profileCompleteInProgress;

  UserProfileModel get profileModel => _profileModel;

  Future<bool> getProfileData(bool fromPin) async {
    _gettingUserProfile = true;
    update();

    final response = await NetworkCaller.getRequest(url: "/ReadProfile");
    _gettingUserProfile = false;
    if (response.isSuccess) {
      _profileModel = UserProfileModel.fromJson(response.returnData);
      if (_profileModel.profile != null) {
        Get.find<CacheController>()
            .saveProfileData(_profileModel.profile!.first);
      } else {
        Get.to(const CompleteProfileScreen());
      }
      update();
      return true;
    } else if (response.statusCode == 401 && !fromPin) {
      await Get.find<CacheController>().logout();
      update();
      return false;
    } else {
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
      final UserProfileModel profileModel =
          UserProfileModel.fromJson(response.returnData);
      if (profileModel.profile != null) {
        Get.find<CacheController>()
            .saveProfileData(profileModel.profile!.first);
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
