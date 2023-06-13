import 'package:eisteintaste/modules/tabbar/controller/tabbar_controller.dart';
import 'package:get/get.dart';

class TabbarBinding implements Bindings {
  
  @override
  void dependencies(){
    Get.lazyPut<TabbarController>(()=>TabbarController());
  }
}
