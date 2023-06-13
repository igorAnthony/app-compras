import 'package:eisteintaste/global/constant/decoration.dart';
import 'package:eisteintaste/global/constant/dimensions.dart';
import 'package:eisteintaste/global/constant/route.dart';
import 'package:eisteintaste/global/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:eisteintaste/modules/login/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
            key: controller.formKey,
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
                    Container(
                      margin: EdgeInsets.only(left: Dimensions.width5),
                      child: bigText("Hello", size: Dimensions.font60, weight: FontWeight.bold)
                    ),
                    smallText("Sign into your account", size: Dimensions.font18),
                    SizedBox(height: Dimensions.height45),
                    Material(
                      elevation: Dimensions.height5,
                      borderRadius: BorderRadius.all(Radius.circular(Dimensions.border30)),
                      shadowColor: Colors.white,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        enableSuggestions: false,
                        autocorrect: false,
                        controller: controller.emailController,
                        // validator: (val) =>
                        //     val!.isEmpty ? 'Invalid email address' : null,
                        decoration: kInputDecoration('Email', Icons.alternate_email),
                      ),
                    ),
                    SizedBox(height: Dimensions.height10),
                    Material(
                      elevation: Dimensions.height5,
                      borderRadius: BorderRadius.all(Radius.circular(Dimensions.border30)),
                      shadowColor: Colors.white,
                      child: TextFormField(
                        controller: controller.passwordController,
                        enableSuggestions: false,
                        autocorrect: false,
                        obscureText: true,
                        // validator: (val) =>
                        //     val!.length < 6 ? 'Invalid password address' : null,
                        decoration: kInputDecoration('Password', Icons.password),
                      ),
                    ),
                    SizedBox(height: Dimensions.height80),
                    controller.isLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 3,
                            ),
                          )
                        : Center(
                          child: kTextButton('Sign in', () {
                            if (controller.formKey.currentState!.validate()) {
                              controller.login();
                            }
                          }),
                        ),
                    SizedBox(height: Dimensions.height40),
                    kLoginOrRegisterHint("Not registered yet? ", 'Register here',
                        () {
                      Get.offAndToNamed(Routes.registerRoute);
                    }),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
