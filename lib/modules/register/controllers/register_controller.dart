import 'package:eisteintaste/global/constant/route.dart';
import 'package:eisteintaste/modules/register/repository/register_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eisteintaste/models/user.dart';

class RegisterController extends GetxController {
  final RegisterRepository registerRepo = Get.find<RegisterRepository>();
  final formKey2 = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController = TextEditingController();

  var isLoading = false.obs;
  var isError = false.obs;
  var errorMessage = ''.obs;
  var user = User().obs;

  Future<void> register() async {
    if(formKey2.currentState!.validate()){
      var auth = await registerRepo.registerUser(nameController.text, emailController.text, passwordController.text);
      print(auth.error);
      if(auth.error == null){
        isLoading.value = true;
        Get.offAndToNamed(Routes.loginRoute);
        Get.showSnackbar(
          GetSnackBar(
            message: 'User Registered Successfully',
            icon: const Icon(Icons.refresh),
            duration: const Duration(seconds: 3),
          ),
        );
      }else{
        Get.snackbar(
          "Alert",
          "${auth.error}",
          colorText: Colors.white,
          backgroundColor: Colors.redAccent,
          icon: const Icon(Icons.add_alert),
        );
      }      
    }
  }
}
