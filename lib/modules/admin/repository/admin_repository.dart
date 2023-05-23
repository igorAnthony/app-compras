import 'package:app_compras/models/api_response.dart';
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
}