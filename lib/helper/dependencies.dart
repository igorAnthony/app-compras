import 'package:eisteintaste/modules/address/binding/address_binding.dart';
import 'package:eisteintaste/modules/cart/bindings/cart_binding.dart';
import 'package:eisteintaste/modules/checkout/binding/checkout_binding.dart';
import 'package:eisteintaste/modules/food/bindings/product_binding.dart';
import 'package:eisteintaste/modules/profile/binding/user_binding.dart';
import 'package:eisteintaste/modules/tabbar/bindings/tabbar_binding.dart';
import 'package:eisteintaste/modules/orders/bindings/orders_bindings.dart';
import 'package:eisteintaste/modules/popular/bindings/popular_binding.dart';
import 'package:eisteintaste/modules/recommended/bindings/recommended_bindings.dart';
import 'package:get/get.dart';

class InitBinding implements Bindings {
  @override
  void dependencies(){
    UserBinding().dependencies();
    CartBinding().dependencies();
    PopularBinding().dependencies();
    RecommendedBinding().dependencies();
    OrdersBinding().dependencies();
    AddressBinding().dependencies();
    TabbarBinding().dependencies();
    CheckOutBinding().dependencies();
    ProductBinding().dependencies();
  }

}
