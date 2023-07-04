import 'package:eisteintaste/models/api_response.dart';
import 'package:eisteintaste/modules/food/repository/product_repository.dart';
import 'package:get/get.dart';


class ProductController extends GetxController {
  ProductRepository _productRepo = Get.find<ProductRepository>();
  
  List<dynamic> _productList = [];
  List<dynamic> get productList => _productList;
  RxBool _isLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();
    getProductData();
  }

  Future<void> getProductData() async {
    ApiResponse response = await _productRepo.getAllProducts();
    if(response.error == null){
      if(response.data != null){
        _productList = response.data as List<dynamic>;
        update();
        _isLoaded.value = true;
        print("aqui deu certo");
        //showMessageSnackbarBottom("Address loaded successfully");
      }
    }
  }

}
