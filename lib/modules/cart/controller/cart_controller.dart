import 'package:app_compras/global/constant/colors.dart';
import 'package:app_compras/models/products_model.dart';
import 'package:app_compras/modules/cart/model/cart_model.dart';
import 'package:app_compras/modules/cart/repository/cart_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  CartRepo cartRepo = Get.find<CartRepo>();
  List<Cart> _cartList = [];
  
  RxInt quant = 0.obs;
  RxDouble totalAmount = 0.0.obs;

  List<dynamic> get cartList => _cartList;
  
  @override
  void onInit(){
    super.onInit();
  }

  Future<void> addItem(Products product, int quantity) async {
    Cart cartItem = Cart(product: product, quantity: quantity);
    int index = alreadyExits(cartItem);
    if(index != -1){
      _cartList[index].quantity += quantity;
    }else{
      _cartList.add(cartItem);
    }
    totalItems();
    priceTotal();
    cartRepo.addToCartList(_cartList);
    update();
  }

  void priceTotal(){
    double totalPrice = 0.0;
    _cartList.forEach((element) { 
      totalPrice += element.product.price!*element.quantity;
    });
    totalAmount.value = totalPrice;
  }
  
  void reset() {
    quant.value = 1;
    totalAmount.value = 0.0;
  }

  void decrementQuantityItem(int index){
    _cartList[index].quantity--;
    
    if (_cartList[index].quantity == 0) {
        _cartList.removeAt(index);
    }
    totalItems();
    priceTotal();
    update();
  }
  void incrementQuantityItem(int index){
    if(_cartList[index].quantity < 20) {
      _cartList[index].quantity++;
    }else{
      Get.snackbar("Item count", "You can't' add more!",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
    }
    totalItems();
    priceTotal();
    update();
    print("in "+ _cartList[index].quantity.toString());
  }
  int alreadyExits(Cart cartItem){
    return _cartList.indexWhere((element) => element.product.id == cartItem.product.id);
  }
  void totalItems(){
    int totalQuantity = 0;
    _cartList.forEach((element) { 
      totalQuantity += element.quantity;
    });
    quant.value = totalQuantity;
    print(quant.value);
  }
}
