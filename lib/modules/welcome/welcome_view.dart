import 'dart:async';

import 'package:eisteintaste/global/constant/dimensions.dart';
import 'package:eisteintaste/global/constant/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
            child: Text('Einstein Taste',
              style: GoogleFonts.amaticSc(
                fontSize: Dimensions.height45,
                fontWeight: FontWeight.bold,
                color: Color(0xFFfa720a)
            ),)
          ),
        ],
      ),
    );
  }
}