import 'package:eisteintaste/models/api_response.dart';
import 'package:eisteintaste/modules/login/provider/login_provider.dart';
import 'package:get/get.dart';

class LoginRepository extends GetxService {
  final LoginProvider loginProvider;

  LoginRepository({required this.loginProvider});
  
  Future<ApiResponse> loginUser(String email, String password) async {
    final response = await loginProvider.login(email, password);
    return response;
  }
}