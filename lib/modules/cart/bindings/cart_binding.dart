import 'package:app_compras/modules/cart/controller/cart_controller.dart';
import 'package:get/get.dart';

class CartBinding implements Bindings {
  
  @override
  void dependencies(){
    Get.lazyPut<CartController>(()=>CartController());
  }
}