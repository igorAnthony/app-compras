import 'package:eisteintaste/models/products_model.dart';

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

