import 'package:app_compras/global/constant/colors.dart';
import 'package:app_compras/global/constant/dimensions.dart';
import 'package:app_compras/global/constant/route.dart';
import 'package:app_compras/global/widgets/text.dart';
import 'package:app_compras/modules/cart/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CartHistory extends StatelessWidget {
  const CartHistory({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.find<CartController>();
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                height: Dimensions.height60,
                color: AppColors.mainColor,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,            
                    children: [
                      bigText("Your cart history", color: Colors.white, size: Dimensions.font20),
                      Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.getCart("carthistoryview"));
                            },
                            child: Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 30,),
                          ),
                          Obx(() => cartController.quant.value >= 1 ? 
                            Positioned(
                              right: Dimensions.height10*0.7,
                              top: (Dimensions.height5)*-0.2,
                              child: Container(
                                width: Dimensions.height15,
                                height: Dimensions.height15,
                                decoration: BoxDecoration(
                                  color: AppColors.mainColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(child: bigText("${cartController.quant.value}", color: Colors.white, size: 12)),
                              )
                            )
                            :Container()
                          ),
                        ]
                      ),
                    ],
                  ),
              ),
                SizedBox(height: Dimensions.height10),
                Container(
                  child: GetBuilder<CartController>(
                      init: cartController,
                      builder: (controller) {
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.historyList.length,
                          itemBuilder: (context, index) {
                              return Text('$index');                        
                          },
                        );
                      }
                  ),
                ),
            ],
          )
          ),
        ),
      );
  }
}
