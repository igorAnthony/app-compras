import 'package:app_compras/modules/register/controllers/register_controller.dart';
import 'package:app_compras/modules/register/provider/register_provider.dart';
import 'package:app_compras/modules/register/repository/register_repository.dart';
import 'package:get/get.dart';

class RegisterBinding implements Bindings {
  
  @override
  void dependencies(){
    Get.lazyPut<RegisterProvider>(()=>RegisterProvider());
    Get.lazyPut<RegisterRepository>(()=>RegisterRepository(registerProvider: Get.find<RegisterProvider>()));
    Get.lazyPut<RegisterController>(()=>RegisterController());
  }
}
