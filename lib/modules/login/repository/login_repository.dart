import 'package:eisteintaste/models/api_response.dart';
import 'package:get/get.dart';

class LoginRepository extends GetxService {
  final loginProvider;

  LoginRepository({required this.loginProvider});
  
  Future<ApiResponse> loginUser(String email, String password) async {
    final response = await loginProvider.login(email, password);
    return response;
  }
}