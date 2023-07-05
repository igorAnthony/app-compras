import 'package:eisteintaste/global/constant/api_constant.dart';
import 'package:eisteintaste/models/api_response.dart';
import 'package:eisteintaste/models/orders_model.dart';
import 'package:eisteintaste/models/user.dart';
import 'package:eisteintaste/modules/address/controller/address_controller.dart';
import 'package:eisteintaste/modules/cart/controller/cart_controller.dart';
import 'package:eisteintaste/modules/checkout/controller/checkout_controller.dart';
import 'package:eisteintaste/modules/orders/repository/orders_repository.dart';
import 'package:eisteintaste/modules/profile/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  OrdersRepository ordersRepository = Get.find<OrdersRepository>();

  List<dynamic> _ordersList = [];
  List<dynamic> get ordersList => _ordersList;
  
  List<dynamic> _ordersListItems = [];
  List<dynamic> get ordersListItems => _ordersListItems;
  double subtotal = 0;
  RxBool isLoading = true.obs;
  bool isCreated = false;
  @override
  void onInit(){
    getOrdersList();
    super.onInit();
  }
  Future<void> getOrdersList() async {
    ApiResponse response = await ordersRepository.getOrdersList();
    if(response.error == null){
      _ordersList = response.data as List<dynamic>;
      update();
    }else{
      Get.showSnackbar(
        GetSnackBar(
          backgroundColor: Colors.red,
          message: response.error.toString(),
          icon: const Icon(Icons.add),
          duration: const Duration(seconds: 1),
        ),
      );
    }
  }
  Future<void> getItemsOfOrders(Orders order) async {
    ApiResponse response = await ordersRepository.getItemsOfOrders(order.id!);
    _ordersListItems.addAll(response.data as List<dynamic>);
    double sum_subtotal = 0;
    for (var voucher in _ordersListItems) {
      sum_subtotal += voucher.totalPrice!; 
    }
    subtotal = sum_subtotal;
    isLoading.value = false;
    update();
    
  }
  Future<ApiResponse> createOrder() async {
    String paymentMethod = Get.find<CheckOutController>().paymentOptionsNames[Get.find<CheckOutController>().paymentOptionsIndex.value];
    int address_id = Get.find<AddressController>().addressList[Get.find<AddressController>().addressTypeIndex].id!;
    User user = Get.find<UserController>().user;
    double total = Get.find<CartController>().totalAmount.value;
    ApiResponse response = await ordersRepository.createOrder(user.id!, total, paymentMethod, address_id);
    
    if(response.error == null){
      late ApiResponse response2;
      int order_id = response.data as int;
      if(order_id != 0){
        response2 = await createOrderItems(order_id);
      }
      return response2;
    }else{
      Get.showSnackbar(
        GetSnackBar(
          backgroundColor: Colors.red,
          message: "Order has not been created!",
          icon: const Icon(Icons.add),
          duration: const Duration(seconds: 1),
        ),
      );
      return response;
    }
  }
  Future<ApiResponse> createOrderItems(int order_id) async {
    ApiResponse response = await ordersRepository.createOrderItems(order_id, Get.find<CartController>().cartList);
    if(response.error == null){
      Get.showSnackbar(
        GetSnackBar(
          backgroundColor: Colors.green,
          message: "Your order has been placed successfully!",
          icon: const Icon(Icons.add),
          duration: const Duration(seconds: 1),
        ),
      );
    }else{
      print(response.error);
      Get.showSnackbar(
        GetSnackBar(
          backgroundColor: Colors.red,
          message: "There was an error when completing the order.",
          icon: const Icon(Icons.add),
          duration: const Duration(seconds: 1),
        ),
      );
    }
    return response;
  }
  void reset(){
    _ordersListItems = [];
    isLoading.value = true;
  }
}