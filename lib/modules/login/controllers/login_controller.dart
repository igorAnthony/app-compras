import 'package:eisteintaste/global/constant/route.dart';
import 'package:eisteintaste/modules/login/repository/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eisteintaste/models/user.dart';

class LoginController extends GetxController {
  final LoginRepository loginRepo = Get.find<LoginRepository>();
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var isError = false.obs;
  var errorMessage = ''.obs;
  var user = User().obs;

  Future<void> login() async {
    if(formKey.currentState!.validate()){
      
      final response = await loginRepo.loginUser(emailController.text, passwordController.text);
      if(response.error == null){
        Get.offAndToNamed(Routes.homeRoute);

        Get.showSnackbar(
          GetSnackBar(
            message: "The user has successfully logged in.",
            icon: const Icon(Icons.refresh),
            duration: const Duration(seconds: 1),
          ),
        );
        
      }  
      else{
        Get.snackbar(
          "Alert",
          "${response.error}",
          colorText: Colors.white,
          backgroundColor: Colors.redAccent,
          icon: const Icon(Icons.add_alert),
        );
      } 
    }
  }
}
