import 'profile.dart';

class UserProfileModel {
  String? msg;
  List<Profile>? profile;

  UserProfileModel({this.msg, this.profile});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      profile = <Profile>[];
      json['data'].forEach((v) {
        profile!.add(Profile.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (profile != null) {
      data['data'] = profile!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}