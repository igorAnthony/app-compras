import 'package:eisteintaste/modules/orders/controller/orders_controller.dart';
import 'package:eisteintaste/modules/orders/provider/orders_provider.dart';
import 'package:eisteintaste/modules/orders/repository/orders_repository.dart';
import 'package:get/get.dart';

class OrdersBinding implements Bindings {
  
  @override
  void dependencies(){
    Get.lazyPut<OrdersProvider>(()=>OrdersProvider(), fenix: true);
    Get.lazyPut<OrdersRepository>(()=>OrdersRepository(ordersProvider: Get.find<OrdersProvider>()), fenix: true);
    Get.lazyPut<OrdersController>(()=>OrdersController(), fenix: true);
  }
}
