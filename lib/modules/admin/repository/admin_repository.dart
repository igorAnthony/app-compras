import 'package:app_compras/models/api_response.dart';
import 'package:app_compras/models/products_model.dart';
import 'package:app_compras/modules/admin/provider/admin_provider.dart';
import 'package:get/get.dart';

class AdminRepository extends GetxService {
  final AdminProvider adminProvider;

  AdminRepository({required this.adminProvider});

  Future<ApiResponse> changeVisibility(int product_id) async {
    final response = await adminProvider.changeVisibility(product_id);
    return response;
  }
  Future<ApiResponse> getProductList() async {
    final response = await adminProvider.getProductList();
    return response;
  }
  Future<ApiResponse> createProduct(Products product) async {
    final response = await adminProvider.createProduct(product);
    return response;
  }
  Future<ApiResponse> editProduct(Products product) async {
    final response = await adminProvider.editProduct(product);
    return response;
  }
  Future<ApiResponse> deleteProduct(int id) async {
    final response = await adminProvider.deleteProduct(id);
    return response;
  }
}