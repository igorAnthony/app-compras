import 'package:eisteintaste/global/constant/route.dart';
import 'package:eisteintaste/models/api_response.dart';
import 'package:eisteintaste/modules/address/views/add_address_view.dart';
import 'package:eisteintaste/modules/cart/controller/cart_controller.dart';
import 'package:eisteintaste/modules/cart/model/cart_model.dart';
import 'package:eisteintaste/modules/checkout/view/payment_view.dart';
import 'package:eisteintaste/modules/checkout/view/review_view.dart';
import 'package:eisteintaste/modules/orders/controller/orders_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutController extends GetxController {
  int _checkOutIndex = 0;
  int get checkOutIndex => _checkOutIndex;

  List<Widget> _checkOutPages = [
    AddAddressView(pageName: "cart"),
    PaymentView(),
    ReviewView(),
  ];
  List<Widget> get checkOutPages => _checkOutPages;

  List<String> _checkOutPageNames = [
    "Shipping",
    "Payment",
    "Review",
  ];
  List<String> get checkOutPageNames => _checkOutPageNames;

  List<String> paymentOptionsNames = [
    "Cash on Delivery",
    "Credit Card",
    "Paypal",
  ];

  List<IconData> paymentOptionsIcons = [
    Icons.money,
    Icons.credit_card,
    Icons.payment,
  ];
  RxInt _paymentOptionsIndex = 0.obs;
  RxInt get paymentOptionsIndex => _paymentOptionsIndex;
  RxBool isMarked = false.obs;

  void setMarked(bool value) {
    isMarked.value = value;
  } 

  void setPagesIndex(int index){
    _checkOutIndex = index;
    update();
  }

  void setPaymentOptionsIndex(int index){
    _paymentOptionsIndex.value = index;
    update();
  }

  void reset(){
    _checkOutIndex = 0;
    update();
  }

  void placeOrder() async {
    ApiResponse response = await Get.find<OrdersController>().createOrder();
    if(response.error == null){
      Get.find<CartController>().clearCart();
      Get.offAllNamed(Routes.homeRoute);
    }    
  }
}
