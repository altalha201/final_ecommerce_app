import 'review.dart';

class ReviewModel {
  String? msg;
  List<Review>? reviews;

  ReviewModel({this.msg, this.reviews});

  ReviewModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      reviews = <Review>[];
      json['data'].forEach((v) {
        reviews!.add(Review.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (reviews != null) {
      data['data'] = reviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}