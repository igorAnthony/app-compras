import 'dart:async';

import 'package:eisteintaste/global/constant/dimensions.dart';
import 'package:eisteintaste/global/constant/route.dart';
import 'package:eisteintaste/modules/address/controller/address_controller.dart';
import 'package:eisteintaste/modules/profile/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> with TickerProviderStateMixin{
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller=new AnimationController(vsync: this, duration: Duration(seconds:2))..forward();
    animation = new CurvedAnimation(parent: controller, curve: Curves.linear);
    Timer(
      const Duration(seconds:3),
      () async {
        SharedPreferences prefs = Get.find<SharedPreferences>();
        
        if(prefs.containsKey('user')) { 
          Get.offAndToNamed(Routes.homeRoute);
          Get.find<UserController>().init();
        }else{
          Get.offAndToNamed(Routes.loginRoute);
        }
      },
    );
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1b141e),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation, 
            child: Center(
              child: Image.asset(
                'assets/images/logo6.png', 
                width: Dimensions.logoSize
              )
            )
          ),
          Center(
            child: Image.asset(
                'assets/images/textlogo.png', 
                width: Dimensions.logoSize
              )
          ),
        ],
      ),
    );
  }
}