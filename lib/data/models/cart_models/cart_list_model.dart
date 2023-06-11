
import 'cart_item.dart';

class CartListModel {
  String? msg;
  List<CartItem>? cartItems;

  CartListModel({this.msg, this.cartItems});

  CartListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      cartItems = <CartItem>[];
      json['data'].forEach((v) {
        cartItems!.add(CartItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (cartItems != null) {
      data['data'] = cartItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
