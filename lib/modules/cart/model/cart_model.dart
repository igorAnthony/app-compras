import 'package:app_compras/models/products_model.dart';

class Cart {
  Products product;
  int quantity;

  Cart({required this.product, required this.quantity});

  Map<String, dynamic> toJson() {
    return {
      'product': product.toJson(),
      'quantity': quantity,
    };
  }
  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      product: Products.fromJson(json['product']),
      quantity: json['quantity'],
    );
  }
}

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