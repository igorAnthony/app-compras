
import 'package:app_compras/modules/admin/controller/admin_controller.dart';
import 'package:app_compras/modules/admin/provider/admin_provider.dart';
import 'package:app_compras/modules/admin/provider/category_provider.dart';
import 'package:app_compras/modules/admin/repository/admin_repository.dart';
import 'package:get/get.dart';

class AdminBinding implements Bindings {
  
  @override
  void dependencies(){
    Get.lazyPut<CategoryProvider>(()=>CategoryProvider());
    Get.lazyPut<AdminProvider>(()=>AdminProvider());
    Get.lazyPut<AdminRepository>(()=>AdminRepository(adminProvider: Get.find<AdminProvider>()));
    Get.lazyPut<AdminController>(()=>AdminController());
  }
}