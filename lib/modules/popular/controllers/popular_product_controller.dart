import 'package:eisteintaste/models/api_response.dart';
import 'package:eisteintaste/global/constant/colors.dart';
import 'package:eisteintaste/models/products_model.dart';
import 'package:eisteintaste/modules/cart/controller/cart_controller.dart';
import 'package:eisteintaste/modules/popular/repository/popular_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularController extends GetxController {
  PopularRepository popularRepo = Get.find<PopularRepository>();
  CartController cartController = Get.find<CartController>();


  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  RxInt quant = 0.obs;
  RxDouble total = 0.0.obs;
  
  
  RxBool _isLoaded = false.obs;
  RxBool get isLoaded => _isLoaded;
  double productPrice = 0.0;
  
  @override
  void onInit(){
    getPopularProductList();
    super.onInit();
  }
  Future<void> getPopularProductList() async {
    ApiResponse response = await popularRepo.getPopularProductList();
    print(response.data);
    _popularProductList.addAll(response.data as List<dynamic>);
    update();
    _isLoaded.value = true;
  }

  void incrementQuant(){
    if(quant.value < 20) {
      quant++;
    }else{
      Get.snackbar("Item count", "You can't' add more!",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
    }
    priceTotal();
  }
  void decrementQuant(){
    if(quant.value > 0){
      quant--;
    }else{
      Get.snackbar("Item count", "You can't' reduce more!",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
    } 
    priceTotal();
  }
  void priceTotal(){
    total.value = productPrice * quant.value.toDouble();
  }
  void setPrice(double price){
    productPrice = price;
    priceTotal();
  }
  void addItem(Products product){
    cartController.addItem(product, quant.value);
  }
  void reset() {
    quant.value = 0;
    total.value = 0.0;
    productPrice = 0.0;
  }
}
