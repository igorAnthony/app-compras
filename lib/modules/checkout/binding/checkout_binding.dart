import 'package:eisteintaste/modules/checkout/controller/checkout_controller.dart';
import 'package:get/get.dart';

class CheckOutBinding implements Bindings {
  
  @override
  void dependencies(){
    Get.lazyPut<CheckOutController>(()=>CheckOutController());
  }
}