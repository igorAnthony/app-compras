import 'package:eisteintaste/modules/admin/binding/admin_binding.dart';
import 'package:eisteintaste/modules/cart/bindings/cart_binding.dart';
import 'package:eisteintaste/modules/login/bindings/login_binding.dart';
import 'package:eisteintaste/modules/tabbar/bindings/tabbar_binding.dart';
import 'package:eisteintaste/modules/orders/bindings/orders_bindings.dart';
import 'package:eisteintaste/modules/popular/bindings/popular_binding.dart';
import 'package:eisteintaste/modules/recommended/bindings/recommended_bindings.dart';
import 'package:eisteintaste/modules/register/bindings/register_binding.dart';
import 'package:get/get.dart';

class InitBinding implements Bindings {
  @override
  void dependencies(){
    LoginBinding().dependencies();
    RegisterBinding().dependencies();
    CartBinding().dependencies();
    PopularBinding().dependencies();
    RecommendedBinding().dependencies();
    OrdersBinding().dependencies();
    AdminBinding().dependencies();
    TabbarBinding().dependencies();
  }

}
