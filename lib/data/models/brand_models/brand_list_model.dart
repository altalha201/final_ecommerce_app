import 'brand.dart';

class BrandListModel {
  String? msg;
  List<Brand>? brands;

  BrandListModel({this.msg, this.brands});

  BrandListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      brands = <Brand>[];
      json['data'].forEach((v) {
        brands!.add(Brand.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (brands != null) {
      data['data'] = brands!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
