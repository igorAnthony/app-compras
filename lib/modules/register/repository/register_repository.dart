import 'package:app_compras/models/api_response.dart';
import 'package:app_compras/modules/register/provider/register_provider.dart';
import 'package:get/get.dart';
class RegisterRepository extends GetxService{
  final RegisterProvider registerProvider;

  RegisterRepository({required this.registerProvider});

  Future<ApiResponse> registerUser(String name, String email, String password) async {
    final response = await registerProvider.register(name, email, password);
    return response;
  }
}