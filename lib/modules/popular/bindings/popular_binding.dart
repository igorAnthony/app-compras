import 'package:app_compras/modules/popular/controllers/popular_product_controller.dart';
import 'package:app_compras/modules/popular/provider/popular_provider.dart';
import 'package:app_compras/modules/popular/repository/popular_repository.dart';
import 'package:get/get.dart';

class PopularBinding implements Bindings {
  @override
  void dependencies(){
    Get.lazyPut<PopularProvider>(()=>PopularProvider());
    Get.lazyPut<PopularRepository>(()=>PopularRepository(popularProvider: Get.find<PopularProvider>()));
    Get.lazyPut<PopularController>(()=>PopularController());
  }
}
