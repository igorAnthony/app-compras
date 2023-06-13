import 'package:eisteintaste/modules/cart/model/cart_model.dart';

class CartHistory {
  List<Cart> cart;

  CartHistory({required this.cart});

  Map<String, dynamic> toJson() {
    return {
      'cart': cart.map((item) => item.toJson()).toList(),
    };
  }

  factory CartHistory.fromJson(Map<String, dynamic> json) {
    return CartHistory(
      cart: List<Cart>.from(json['cart'].map((item) => Cart.fromJson(item))),
    );
  }
}