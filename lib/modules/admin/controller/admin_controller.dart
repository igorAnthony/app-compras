import 'package:app_compras/models/api_response.dart';
import 'package:app_compras/models/products_model.dart';
import 'package:app_compras/modules/admin/repository/admin_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminController extends GetxController {
  AdminRepository adminRepo = Get.find<AdminRepository>();
  //CartController cartController = Get.find<CartController>();

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  List<dynamic> _productList = [];
  List<dynamic> get productList => _productList;

  RxBool _isLoaded = false.obs;
  RxBool get isLoaded => _isLoaded;
  RxBool isVisible = false.obs;
  RxBool isChecked = true.obs;
  bool isUpdated = false;

  @override
  void onInit() {
    _getProductList();
    super.onInit();
  }

  Future<void> _getProductList() async {
    ApiResponse response = await adminRepo.getProductList();
    _productList.addAll(response.data as List<dynamic>);
    update();
    // _isLoaded.value = true;
  }

  Future<void> changeTheVisibility(int index) async {
    ApiResponse response =
        await adminRepo.changeVisibility(_productList[index].id);
    if (response.error == null) {
      Get.showSnackbar(
        GetSnackBar(
          message: _productList[index].visibility == "visible"
              ? "Product is hidden!"
              : "Product is visible!",
          duration: const Duration(seconds: 1),
        ),
      );
      _productList[index].visibility =
          _productList[index].visibility == "1" ? "0" : "1";
      update();
    }
  }

  Future<void> addItem() async {
    Products newProduct = new Products(name: nameController.text, description: descriptionController.text, price: priceController.text, visibility: isChecked.value ? '1' : '0');
    ApiResponse response = await adminRepo.createProduct(newProduct);
    if(response.error == null){
      Products createdProduct = response.data as Products;
      _productList.add(createdProduct);
      update();
      Get.showSnackbar(
        GetSnackBar(
          message: "Item has been added",
          duration: const Duration(seconds: 1),
        ),
      );
    }else{
      Get.showSnackbar(
        GetSnackBar(
          message: "There was a problem trying to register: " + response.error!,
          duration: const Duration(seconds: 1),
        ),
      );
    }   
  }
  Future<void> editItem(int index) async {
    _productList[index].name = nameController.text;
    _productList[index].description = descriptionController.text;
    _productList[index].price = priceController.text;
    _productList[index].visibility = isChecked.value ? "1" : "0";
    //Products product = new Products(name: nameController.text, description: descriptionController.text, price: priceController.text);
    ApiResponse response = await adminRepo.editProduct(_productList[index]);
    if(response.error == null){
      update();
      Get.showSnackbar(
        GetSnackBar(
          message: "Item has been updated",
          duration: const Duration(seconds: 1),
        ),
      );
    }else{
      Get.showSnackbar(
        GetSnackBar(
          message: "There was a problem trying to update: " + response.error!,
          duration: const Duration(seconds: 1),
        ),
      );
    }
    
  }
  void deleteItem(int index) async {
    if(_productList[index].id != null){
      ApiResponse response = await adminRepo.deleteProduct(_productList[index].id);
      if(response.error == null){
        _productList.removeAt(index);
        Get.showSnackbar(
          GetSnackBar(
            message: "Item has been deleted",
            duration: const Duration(seconds: 1),
          ),
        );
        update();
      }else{
        Get.showSnackbar(
          GetSnackBar(
            message: "There was a problem trying to delete: " + response.error!,
            duration: const Duration(seconds: 1),
          ),
        );
      }
    }
    
    
  }
  void reset() {
    nameController.text = "";
    descriptionController.text = "";
    priceController.text = "";
    isChecked.value = true;
    isUpdated = false;
  }
  void updateTheValues(int index){
    Products product = _productList[index];
    nameController.text = product.name!;
    descriptionController.text = product.description!;
    priceController.text = product.price!;
    isUpdated = true;
    isChecked.value = product.visibility == "0" ? false : true;
  }


}
