import 'package:eisteintaste/global/constant/colors.dart';
import 'package:eisteintaste/global/constant/decoration.dart';
import 'package:eisteintaste/global/constant/dimensions.dart';
import 'package:eisteintaste/global/constant/route.dart';
import 'package:eisteintaste/global/widgets/text.dart';
import 'package:eisteintaste/modules/cart/controller/cart_controller.dart';
import 'package:eisteintaste/modules/cart/model/cart_model.dart';
import 'package:eisteintaste/modules/cart/model/cart_model_history.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CartHistoryView extends StatelessWidget {
  const CartHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.find<CartController>();
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width30),
                height: Dimensions.height60,
                color: AppColors.mainColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,            
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
                          :SizedBox()
                        ),
                      ]
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: Dimensions.height10),
                child: GetBuilder<CartController>(
                    init: cartController,
                    builder: (controller) {
                      return GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.historyList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: Dimensions.screenWidth/(Dimensions.screenHeight / 3.5),
                          mainAxisSpacing: 5.0,
                        ),
                        itemBuilder: (context, index) {
                          CartHistory history = controller.historyList[index];
                          int cart_history_index = index;
                          List<Cart> cart = history.cart;
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: Dimensions.height5, vertical: Dimensions.height20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.radius10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                buildMaterialDecoration(heightElevation: Dimensions.height3,borderRadius: Dimensions.radius5,Container(
                                    padding: EdgeInsets.symmetric(vertical: Dimensions.height5, horizontal: Dimensions.height10),
                                    decoration: BoxDecoration(
                                      border: Border(
                                      bottom: BorderSide(
                                        width: 1,
                                        color: Colors.grey.withOpacity(0.1),
                                      )
                                      )
                                    ),
                                    child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: cart.length,
                                      itemBuilder: (context, index){
                                        Cart item = cart[index];
                                        return Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                                                padding: EdgeInsets.symmetric(vertical: Dimensions.height012, horizontal: Dimensions.height3),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(3),
                                                  color: Colors.black.withOpacity(0.1),
                                                ),
                                                child: smallText("${item.quantity}", color: Colors.black),
                                              ),
                                              SizedBox(width: Dimensions.width5),
                                              smallText("${item.product.name}", color: Colors.black, size: Dimensions.font16)
                                            ],
                                          )
                                        );
                                      }),
                                  ),
                                ),
                                SizedBox(height: Dimensions.height5),
                                GestureDetector(
                                  onTap: () {
                                    controller.addPreviousCartListInCart(cart_history_index);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: Dimensions.height5, horizontal: Dimensions.width10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.shopping_cart, color: Colors.redAccent),
                                        SizedBox(width: Dimensions.width5),
                                        smallText("Add to cart", color: Colors.redAccent),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );                        
                        },
                      );
                    }
                ),
              ),
            ],
          )),
        ),
      );
  }
}
