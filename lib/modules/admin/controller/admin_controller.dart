import 'package:app_compras/models/api_response.dart';
import 'package:app_compras/models/products_model.dart';
import 'package:app_compras/modules/admin/repository/admin_repository.dart';
import 'package:get/get.dart';

class AdminController extends GetxController {
  AdminRepository adminRepo = Get.find<AdminRepository>();
  //CartController cartController = Get.find<CartController>();


  List<dynamic> _productList = [];
  List<dynamic> get productList => _productList;

 
  RxBool _isLoaded = false.obs;
  RxBool get isLoaded => _isLoaded;
  RxBool isVisible = false.obs;

  @override
  void onInit(){
    _getProductList();
    super.onInit();
  }
  Future<void> _getProductList() async {
    ApiResponse response = await adminRepo.getProductList();
    print(response.data);
    _productList.addAll(response.data as List<dynamic>);
    update();
    // _isLoaded.value = true;
  }
  Future<void> changeTheVisibility(int index)async{
    ApiResponse response = await adminRepo.changeVisibility(_productList[index].id);
    print("valor do error ${response.error}");
    if(response.error == null){
      Get.showSnackbar(
        GetSnackBar(
          message: _productList[index].visibility == "visible" ? "Product is hidden!" : "Product is visible!",
          duration: const Duration(seconds: 1),
        ),
      );
      _productList[index].visibility = _productList[index].visibility == "visible" ? "hidden" : "visible";
      update();
    }
    
  }
  void addItem(Products product){
    //cartController.addItem(product, quant.value);
  }
  void deleteItem(Products product){
    //cartController.addItem(product, quant.value);
  }
}
