import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/models/profile_data.dart';
import '../screens/email_verification_screen.dart';

class AuthController extends GetxController {
  static String? _token;
  static ProfileData? _profileData;

  static String? get token => _token;

  static ProfileData? get profileData => _profileData;

  bool isLoggedIn() {
    getToken();
    getProfileData();
    return _token != null;
  }

  void saveToken(String userToken) {
    _token = userToken;
    GetStorage().write("crafty_token", _token);
  }

  void saveProfileData(ProfileData profile) {
    _profileData = profile;
    GetStorage().write("user_profile", jsonEncode(profile));
  }

  void getToken() {
    _token = GetStorage().read("crafty_token");
  }

  void getProfileData() {
    final profileDataString = GetStorage().read("user_profile");
    if (profileDataString != null) {
      _profileData = ProfileData.fromJson(jsonDecode(profileDataString) ?? '{}');
    }
  }

  void clearUserData() {
    GetStorage().erase();
    _token = null;
  }

  void logout() {
    clearUserData();
    Get.to(const EmailVerificationScreen());
  }

  bool checkAuthValidation() {
    final authState = isLoggedIn();
    Get.to(const EmailVerificationScreen());
    return authState;
  }
}
