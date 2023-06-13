import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eisteintaste/global/constant/route.dart';

class TabbarController extends GetxController {
  var currentIndex = 0.obs;
  ScrollController scrollController =  ScrollController ();
  double position = 0.0;
  double sensitivityFactor = 20.0;
  String scrollDirection = "";

  void onTabTapped(int index) {
      currentIndex.value = index;
  }
  Future<dynamic>? getToNamed(){
    switch(currentIndex.value){
      case 0:
        return Get.toNamed(Routes.foodPageRoute);
      case 1:
        return Get.toNamed(Routes.ordersRoute);
      case 2:
        return Get.toNamed(Routes.cartRoute);
      case 3:
        return Get.toNamed(Routes.profileRoute);
      default:
        return Get.toNamed(Routes.homeRoute);
    }
  }


  // final pages = <String>[Routes.homeRoute, Routes.menuRoute, Routes.cartRoute, Routes.profileRoute];

  // void changePage(int index) {
  //   currentIndex.value = index;
  // }
  
}