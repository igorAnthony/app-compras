import 'package:eisteintaste/models/api_response.dart';
import 'package:eisteintaste/global/constant/colors.dart';
import 'package:eisteintaste/models/products_model.dart';
import 'package:eisteintaste/modules/cart/controller/cart_controller.dart';
import 'package:eisteintaste/modules/recommended/repository/recommended_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecommendedController extends GetxController {
  RecommendedRepository recommendedProductRepo = Get.find<RecommendedRepository>();
  CartController cartController = Get.find<CartController>();
  
  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;

  RxInt quant = 0.obs;
  RxDouble total = 0.0.obs;
  RxDouble price_item = 0.0.obs;
  @override
  void onInit(){
    getRecommendedProductList();
    super.onInit();
  }
  Future<void> getRecommendedProductList() async {
    ApiResponse response = await recommendedProductRepo.getRecommendedProductList();
    //print(response.data);
    _recommendedProductList.addAll(response.data as List<dynamic>);
    update();
  }
  void setTotal(double total_price){
    price_item.value = total_price;
    total.value = price_item.value;
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
  void addItem(Products product){
    cartController.addItem(product, quant.value);
  }
  void priceTotal(){
    //print(quant.value.toDouble());
    total.value =  price_item * quant.value.toDouble();
  }
  void reset(){
    quant.value = 0;
  }
}