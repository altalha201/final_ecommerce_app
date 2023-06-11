import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/profile_models/profile.dart';
import '../../screens/auth_screens/email_verification_screen.dart';

class CacheController extends GetxController {
  static String? _token;
  static Profile? _profileData;

  static String? get token => _token;

  static Profile? get profileData => _profileData;

  Future<bool> isLoggedIn() async {
    await getToken();
    return _token != null;
  }

  Future<void> saveToken(String userToken) async {
    _token = userToken;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString("crafty_token", userToken);
  }

  Future<void> saveProfileData(Profile profile) async {
    _profileData = profile;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String date = jsonEncode(profile);
    await preferences.setString("crafty_user", date);
  }

  Future<void> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _token = preferences.getString("crafty_token");
  }

  Future<void> getProfileData() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _profileData = Profile.fromJson(
        jsonDecode(preferences.getString("crafty_user") ?? ""));
  }

  Future<void> clearUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    _token = null;
  }

  Future<void> logout() async {
    await clearUserData();
    Get.to(const EmailVerificationScreen());
  }

  Future<bool> checkAuthValidation() async {
    final authState = await isLoggedIn();
    Get.to(const EmailVerificationScreen());
    return authState;
  }
}
