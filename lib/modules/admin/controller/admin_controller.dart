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
  bool isChecked = false;
  @override
  void onInit() {
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

  Future<void> changeTheVisibility(int index) async {
    ApiResponse response =
        await adminRepo.changeVisibility(_productList[index].id);
    print("valor do error ${response.error}");
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
          _productList[index].visibility == "visible" ? "hidden" : "visible";
      update();
    }
  }

  Future<void> addItem() async {
    Products product = new Products(name: nameController.text, description: descriptionController.text, price: priceController.text);
    ApiResponse response = await adminRepo.createProduct(product);
    if(response.error == null){
      _getProductList();
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
    Products product =  _productList[index];
    product.name = nameController.text;
    product.description = descriptionController.text;
    product.price = priceController.text;
    //Products product = new Products(name: nameController.text, description: descriptionController.text, price: priceController.text);
    ApiResponse response = await adminRepo.editProduct(product);
    if(response.error == null){
      _getProductList();
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
    Products product =  _productList[index];
    int id = product.id!;
    ApiResponse response = await adminRepo.deleteProduct(id);
    if(response.error == null){
      _getProductList();
      Get.showSnackbar(
        GetSnackBar(
          message: "Item has been deleted",
          duration: const Duration(seconds: 1),
        ),
      );
    }else{
      Get.showSnackbar(
        GetSnackBar(
          message: "There was a problem trying to delete: " + response.error!,
          duration: const Duration(seconds: 1),
        ),
      );
    }
  }
  void reset() {
    nameController.text = "";
    descriptionController.text = "";
    priceController.text = "";
    isChecked = false;
  }
  void updateTheValues(int index){
    Products product = _productList[index];
    nameController.text = product.name!;
    descriptionController.text = product.description!;
    priceController.text = product.price!;
    if(product.visibility == "visible"){
      isChecked = true;
    }else{
      isChecked = false;
    }
  }
}
