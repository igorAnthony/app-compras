import 'package:eisteintaste/modules/register/controllers/register_controller.dart';
import 'package:eisteintaste/modules/register/provider/register_provider.dart';
import 'package:eisteintaste/modules/register/repository/register_repository.dart';
import 'package:get/get.dart';

class RegisterBinding implements Bindings {
  
  @override
  void dependencies(){
    Get.lazyPut<RegisterProvider>(()=>RegisterProvider(), fenix: true);
    Get.lazyPut<RegisterRepository>(()=>RegisterRepository(registerProvider: Get.find<RegisterProvider>()), fenix: true);
    Get.lazyPut<RegisterController>(()=>RegisterController(), fenix: true);
  }
}
