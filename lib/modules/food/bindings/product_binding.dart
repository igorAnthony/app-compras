import 'package:eisteintaste/modules/food/controller/product_controller.dart';
import 'package:eisteintaste/modules/food/provider/product_provider.dart';
import 'package:eisteintaste/modules/food/repository/product_repository.dart';
import 'package:eisteintaste/modules/search/controller/search_controller.dart';
import 'package:get/get.dart';

class ProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductProvider>(() => ProductProvider(), fenix: true);
    Get.lazyPut<ProductRepository>(() => ProductRepository(productProvider: Get.find<ProductProvider>()), fenix: true);
    Get.lazyPut<ProductController>(() => ProductController(), fenix: true);
    Get.lazyPut<SearchProductController>(() => SearchProductController(), fenix: true);
  }  
}
