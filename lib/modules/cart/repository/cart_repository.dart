import 'dart:convert';
import 'package:app_compras/global/constant/app_constant.dart';
import 'package:app_compras/modules/cart/model/cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/cart_model_history.dart';

class CartRepo{
  final SharedPreferences sharedPreferences;
  
  CartRepo({required this.sharedPreferences});

  List<String> cart = [];

  void addToCartList(List<Cart> cartList){
    cart = [];
    cartList.forEach((element) => cart.add(jsonEncode(element)));
    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
  }
  
  List<Cart> getCartList(){
    List<String> carts = [];
    if(sharedPreferences.containsKey(AppConstants.CART_LIST)){
      carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
    }else{
      return [];
    }
    List<Cart> cartList = [];
    carts.forEach((element) => cartList.add(Cart.fromJson(jsonDecode(element))));
    return cartList;
  }
  
  void addToCartHistory(List<Cart> cartList) {
    List<CartHistory> historyList = getCartHistory();
    
    bool alreadyExists = historyList.any((cartHistory) {
      List<Cart> existingCarts = cartHistory.cart;
      
      if (existingCarts.length != cartList.length) {
        return false;
      }
      
      for (int i = 0; i < existingCarts.length; i++) {
        Cart existingCart = existingCarts[i];
        Cart newCart = cartList[i];
        
        if (existingCart.product.id != newCart.product.id) {
          return false;
        }
      }
      
      return true;
    });
    
    if (alreadyExists) {
      return;
    }
    
    CartHistory carts = CartHistory(cart: cartList);
    historyList.add(carts);
    
    List<String> cartHistoryJson = historyList.map((cart) => jsonEncode(cart.toJson())).toList();
    removeCart();
    sharedPreferences.setStringList(AppConstants.CART_HISTORY, cartHistoryJson);
  }

  void removeCart(){
    sharedPreferences.remove(AppConstants.CART_LIST);
  }

  List<CartHistory> getCartHistory() {
    List<String> carts = [];
    if (sharedPreferences.containsKey(AppConstants.CART_HISTORY)) {
      carts = sharedPreferences.getStringList(AppConstants.CART_HISTORY) ?? [];
    } else {
      return [];
    }
    List<CartHistory> cartHistory = [];
    for (String element in carts) {
      cartHistory.add(CartHistory.fromJson(jsonDecode(element)));
    }
    return cartHistory;
  }
}
  