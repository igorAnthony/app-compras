import 'package:eisteintaste/global/constant/colors.dart';
import 'package:eisteintaste/models/products_model.dart';
import 'package:eisteintaste/modules/cart/model/cart_model.dart';
import 'package:eisteintaste/modules/cart/repository/cart_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/cart_model_history.dart';

class CartController extends GetxController {
  CartRepo cartRepo = Get.find<CartRepo>();


  List<Cart> _cartList = [];
  List<CartHistory> _historyList = [];

  RxInt quant = 0.obs;
  RxDouble totalAmount = 0.0.obs;

  List<Cart> get cartList => _cartList;
  List<CartHistory> get historyList => _historyList;

  
  @override
  void onInit(){
    super.onInit();
  }

  Future<void> addItem(Products product, int quantity) async {
    Cart cartItem = Cart(product: product, quantity: quantity);
    int index = getIndexInList(cartItem);
    if(index != -1){
      _cartList[index].quantity += quantity;
    }else{
      _cartList.add(cartItem);
    }
    Get.showSnackbar(
      GetSnackBar(
        backgroundColor: AppColors.mainColor,
        message: "Has been added to cart!",
        icon: const Icon(Icons.add),
        duration: const Duration(seconds: 1),
      ),
    );
    calculateCartTotal();
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
    calculateCartTotal();
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
    calculateCartTotal();
  }
  int getIndexInList(Cart cartItem){
    return _cartList.indexWhere((element) => element.product.id == cartItem.product.id);
  }
  void calculateCartTotal() {
    int totalQuantity = 0;
    double totalPrice = 0.0;
    
    _cartList.forEach((element) { 
      totalQuantity += element.quantity;
      totalPrice += element.product.price! * element.quantity;
    });
    
    quant.value = totalQuantity;
    totalAmount.value = totalPrice;
    cartRepo.addToCartList(_cartList);
    
    update();
  }
  void getCartData(){
    List<Cart> storageItems = [];
    storageItems = cartRepo.getCartList();
    if(!storageItems.isEmpty){
      _cartList.addAll(storageItems);
      calculateCartTotal();
    }
  }
  void getCartHistoryData(){
    List<CartHistory> storageItems = [];
    storageItems = cartRepo.getCartHistory();
    if(!storageItems.isEmpty){
      _historyList.addAll(storageItems);
      print(_historyList.length);
    }
  }
  void clearCart(){
    cartRepo.addToCartHistory(_cartList);
    _cartList = [];
    cartRepo.addToCartList(_cartList);
    calculateCartTotal();
  }
  void addPreviousCartListInCart(int cartHistoryIndex){
    final CartHistory? previousCartList = _historyList[cartHistoryIndex];
    
    if(previousCartList != null){
      List<Cart> listCart = previousCartList.cart;
      listCart.forEach((element) {
        addItem(element.product, element.quantity);
      });
    }
  }
}
