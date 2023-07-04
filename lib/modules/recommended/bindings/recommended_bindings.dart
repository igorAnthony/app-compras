import 'package:eisteintaste/modules/recommended/controllers/recommended_controller.dart';
import 'package:eisteintaste/modules/recommended/provider/recommended_provider.dart';
import 'package:eisteintaste/modules/recommended/repository/recommended_repository.dart';
import 'package:get/get.dart';

class RecommendedBinding implements Bindings {
  
  @override
  void dependencies(){
    Get.lazyPut<RecommendedProvider>(()=>RecommendedProvider(), fenix: true);
    Get.lazyPut<RecommendedRepository>(()=>RecommendedRepository(recommendedProvider: Get.find<RecommendedProvider>()), fenix: true);
    Get.lazyPut<RecommendedController>(()=>RecommendedController(), fenix: true);
  }
}
