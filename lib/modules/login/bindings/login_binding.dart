import 'package:eisteintaste/modules/login/controllers/login_controller.dart';
import 'package:eisteintaste/modules/login/provider/login_provider.dart';
import 'package:eisteintaste/modules/login/repository/login_repository.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  
  @override
  void dependencies(){
    Get.lazyPut<LoginProvider>(()=>LoginProvider());
    Get.lazyPut<LoginRepository>(()=>LoginRepository(loginProvider: Get.find<LoginProvider>()));
    Get.lazyPut<LoginController>(()=>LoginController());
  }
}
