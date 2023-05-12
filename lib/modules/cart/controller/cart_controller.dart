import 'package:app_compras/global/constant/colors.dart';
import 'package:app_compras/models/cart_model.dart';
import 'package:app_compras/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {

  List<CartProduct> _cartProductList = [];
  
  RxInt quant = 0.obs;
  RxDouble totalAmount = 0.0.obs;

  List<dynamic> get cartProductList => _cartProductList;
  
  @override
  void onInit(){
    super.onInit();
  }

  Future<void> addItem(Products product, int quantity) async {
    CartProduct cartItem = CartProduct(product: product, quantity: quantity);
    int index = alreadyExits(cartItem);
    if(index != -1){
      _cartProductList[index].quantity += quantity;
    }else{
      _cartProductList.add(cartItem);
    }
    totalItems();
    priceTotal();
    print("cart: " + _cartProductList.length.toString());
    update();
  }

  void priceTotal(){
    double totalPrice = 0.0;
    _cartProductList.forEach((element) { 
      totalPrice += double.parse(element.product.price!)*element.quantity;
    });
    totalAmount.value = totalPrice;
  }
  
  void reset() {
    quant.value = 1;
    totalAmount.value = 0.0;
  }

  void decrementQuantityItem(int index){
    _cartProductList[index].quantity--;
    
    if (_cartProductList[index].quantity == 0) {
        _cartProductList.removeAt(index);
    }
    totalItems();
    priceTotal();
    update();
  }
  void incrementQuantityItem(int index){
    if(_cartProductList[index].quantity < 20) {
      _cartProductList[index].quantity++;
    }else{
      Get.snackbar("Item count", "You can't' add more!",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
    }
    totalItems();
    priceTotal();
    update();
    print("in "+ _cartProductList[index].quantity.toString());
  }
  int alreadyExits(CartProduct cartItem){
    return _cartProductList.indexWhere((element) => element.product.id == cartItem.product.id);
  }
  void totalItems(){
    int totalQuantity = 0;
    _cartProductList.forEach((element) { 
      totalQuantity += element.quantity;
    });
    quant.value = totalQuantity;
    print(quant.value);
  }
}
