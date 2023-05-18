import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/profile_data.dart';

class AuthController extends GetxController {
  static String? _token;
  static ProfileData? _profileData;

  static String? get token => _token;

  static ProfileData? get profileData => _profileData;

  Future<bool> isLoggedIn() async {
    log(_token.toString());
    await getToken();

    return _token != null;
  }

  Future<void> saveToken(String userToken) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _token = userToken;
    await preferences.setString("token", userToken);
  }

  Future<void> saveProfileData(ProfileData profile) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _profileData = profile;
    await preferences.setString('user_profile', profile.toJson().toString());
  }

  Future<void> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _token = preferences.getString("token");
  }

  Future<void> getProfileData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _profileData = ProfileData.fromJson(
      jsonDecode(preferences.getString("user_profile") ?? '{}'),
    );
  }

  Future<void> clearUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
