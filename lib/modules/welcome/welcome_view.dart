import 'dart:async';

import 'package:app_compras/global/constant/dimensions.dart';
import 'package:app_compras/global/constant/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      ()=>Get.offNamed(Routes.loginRoute),
    );
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation, 
            child: Center(
              child: Image.asset(
                'assets/images/logo.png', 
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