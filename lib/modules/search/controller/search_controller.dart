import 'package:eisteintaste/models/products_model.dart';
import 'package:eisteintaste/modules/food/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchProductController extends GetxController {
  List<dynamic> _searchList = [];
  List<dynamic> get searchList => _searchList;

  RxBool isSearch = false.obs;
  TextEditingController searchController = TextEditingController();

  void search(String query) {
    isSearch.value = false;
    List<dynamic> products = Get.find<ProductController>().productList;

    _searchList = products
        .where((product) =>
            product.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    print(_searchList.length);
    update();
    isSearch.value = true;
    
  }
  void reset(){
    _searchList = [];
    searchController.clear();
    update();
    isSearch.value = false;
  }
}