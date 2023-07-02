
import 'package:eisteintaste/modules/address/controller/address_controller.dart';
import 'package:eisteintaste/modules/address/provider/address_provider.dart';
import 'package:eisteintaste/modules/address/repository/address_repository.dart';
import 'package:get/get.dart';

class AddressBinding implements Bindings {
  
  @override
  void dependencies(){
    Get.put<AddressProvider>(AddressProvider(), permanent: true);
    Get.put<AddressRepository>(AddressRepository(addressProvider: Get.find<AddressProvider>()), permanent: true);
    Get.lazyPut<AddressController>(()=>AddressController(), fenix: true);
  }
}