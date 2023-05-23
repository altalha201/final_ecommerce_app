import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../data/models/profile_data.dart';

class AuthController extends GetxController {
  static String? _token;
  static ProfileData? _profileData;

  static String? get token => _token;

  static ProfileData? get profileData => _profileData;

  Future<bool> isLoggedIn() async {
    await getToken();
    await getProfileData();
    return _token != null;
  }

  Future<void> saveToken(String userToken) async {
    _token = userToken;
    GetStorage().write("crafty_token", _token);
  }

  Future<void> saveProfileData(ProfileData profile) async {
    _profileData = profile;
    GetStorage().write("user_profile", jsonEncode(profile));
  }

  Future<void> getToken() async {
    _token = GetStorage().read("crafty_token");
  }

  Future<void> getProfileData() async {
    final profileDataString = GetStorage().read("user_profile");
    if (profileDataString != null) {
      _profileData = ProfileData.fromJson(jsonDecode(profileDataString) ?? '{}');
    }
  }

  Future<void> clearUserData() async {
    GetStorage().erase();
  }
}
