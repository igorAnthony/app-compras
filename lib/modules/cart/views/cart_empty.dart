import 'package:app_compras/global/constant/colors.dart';
import 'package:app_compras/global/constant/dimensions.dart';
import 'package:app_compras/global/constant/route.dart';
import 'package:app_compras/global/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyCartView extends StatelessWidget {
  const EmptyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.maxFinite,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/empty-cart.png",),
              ),
            ),
          ),
          SizedBox(height: Dimensions.height10),
          bigText("Your Cart is Empty", size: Dimensions.font24, weight: FontWeight.w500),
          SizedBox(height: Dimensions.height10),
          Container(width: Dimensions.width250, child: smallText("Looks like you haven't added anything to your cart yet", size: Dimensions.font16, textAlign: TextAlign.center)),
          SizedBox(height: Dimensions.height40),
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.homeRoute);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: Dimensions.height15, horizontal: 50),
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(Dimensions.border30),
              ),
              child: smallText('Start Shopping', color: Colors.white, size: Dimensions.font16, weight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}