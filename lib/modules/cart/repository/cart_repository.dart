import 'dart:convert';
import 'package:app_compras/global/constant/app_constant.dart';
import 'package:app_compras/modules/cart/model/cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
}
  