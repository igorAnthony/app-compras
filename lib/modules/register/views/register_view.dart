import 'package:app_compras/global/constant/decoration.dart';
import 'package:app_compras/global/constant/dimensions.dart';
import 'package:app_compras/global/constant/route.dart';
import 'package:app_compras/modules/register/controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: 
        Form(
          key: controller.formKey2,
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
              alignment: Alignment.center,
              height: Dimensions.screenHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: Dimensions.height30),
                    child: 
                    Center(
                      child: 
                        Image.asset(
                          'assets/images/logo.png',
                          width: Dimensions.height120
                        )
                    ),
                  ),
                  buildMaterialDecoration(TextFormField(
                      keyboardType: TextInputType.name,
                      enableSuggestions: false,
                      autocorrect: false,
                      controller: controller.nameController,
                      //validator: (val) => val!.isEmpty ? 'Invalid name' : null,
                      decoration: kInputDecoration('Name', Icons.person),
                    ),
                  ),
                  SizedBox(height: Dimensions.height10),
                  buildMaterialDecoration(TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      enableSuggestions: false,
                      autocorrect: false,
                      controller: controller.emailController,
                      //validator: (val) => val!.isEmpty ? 'Invalid email address' : null,
                      decoration: kInputDecoration('Email', Icons.alternate_email),
                    ),
                  ),
                  SizedBox(height: Dimensions.height10),
                  buildMaterialDecoration(TextFormField(
                      controller: controller.passwordController,
                      enableSuggestions: false,
                      autocorrect: false,
                      obscureText: true,
                      // validator: (val) =>
                      //     val!.length < 6 ? 'Invalid password address' : null,
                      decoration: kInputDecoration('Password', Icons.password),
                    ),
                  ),
                  SizedBox(height: Dimensions.height10),
                  buildMaterialDecoration(TextFormField(
                      controller: controller.passwordConfirmationController,
                      enableSuggestions: false,
                      autocorrect: false,
                      obscureText: true,
                      // validator: (val) => val != controller.passwordController.text
                      //     ? 'Confirm password does not match'
                      //     : null,
                      decoration: kInputDecoration('Confirm password', Icons.password),
                    ),
                  ),
                  SizedBox(height: Dimensions.height40),
                  controller.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                          ),
                        )
                      : Center(
                        child: kTextButton('Sign up', () {
                            controller.isLoading.value = true;
                            controller.register();
                          }),
                      ),
                  SizedBox(height: Dimensions.height30),
                  kLoginOrRegisterHint("Already have an account? ", 'Login here', () {
                    Get.offAndToNamed(Routes.loginRoute);
                  }),
                ],
              )
            ),
          ),
        )
      )
    );
  }
}
