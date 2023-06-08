import '../profile_models/profile.dart';

class Review {
  int? id;
  String? description;
  String? email;
  int? productId;
  String? createdAt;
  String? updatedAt;
  Profile? profile;

  Review(
      {this.id,
        this.description,
        this.email,
        this.productId,
        this.createdAt,
        this.updatedAt,
        this.profile});

  Review.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    email = json['email'];
    productId = json['product_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profile =
    json['profile'] != null ? Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['description'] = description;
    data['email'] = email;
    data['product_id'] = productId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (profile != null) {
      data['profile'] = profile!.toJson();
    }
    return data;
  }
}