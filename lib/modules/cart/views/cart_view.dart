import 'package:app_compras/global/constant/colors.dart';
import 'package:app_compras/global/constant/dimensions.dart';
import 'package:app_compras/global/constant/route.dart';
import 'package:app_compras/global/widgets/text.dart';
import 'package:app_compras/modules/cart/model/cart_model.dart';
import 'package:app_compras/modules/cart/controller/cart_controller.dart';
import 'package:app_compras/modules/cart/views/cart_empty.dart';
import 'package:app_compras/modules/popular/controllers/popular_product_controller.dart';
import 'package:app_compras/modules/recommended/controllers/recommended_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_compras/global/widgets/app_icon.dart';

class CartView extends StatelessWidget {
  final String page;

  const CartView({required this.page, super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.find<CartController>();

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
                top: Dimensions.height20,
                left: Dimensions.width20,
                right: Dimensions.width20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: appIcon(Icons.arrow_back_ios,
                          iconColor: Colors.white,
                          backgroundColor: AppColors.mainColor,
                          iconSize: Dimensions.iconSize24),
                    ),
                    SizedBox(width: Dimensions.width20),
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.homeRoute),
                      child: appIcon(Icons.home_outlined,
                          iconColor: Colors.white,
                          backgroundColor: AppColors.mainColor,
                          iconSize: Dimensions.iconSize24),
                    ),
                    appIcon(Icons.shopping_cart,
                        iconColor: Colors.white,
                        backgroundColor: AppColors.mainColor,
                        iconSize: Dimensions.iconSize24),
                  ],
                )),
            Positioned(
              top: Dimensions.height20 * 4,
              left: Dimensions.width20,
              right: Dimensions.width20,
              bottom: 0,
              child: Obx(() => cartController.quant.value >= 1 ? Container(
                child: GetBuilder<CartController>(
                    init: cartController,
                    builder: (controller) {
                      final _cartList = controller.cartList;
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.cartList.length,
                        itemBuilder: (context, index) {
                          Cart cartItem = _cartList[index];
                          return Container(
                            margin: EdgeInsets.only(bottom: Dimensions.height10),
                            width: double.maxFinite,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    var popularIndex = Get.find<PopularController>().popularProductList.indexOf(_cartList[index].product!);
                                    if(popularIndex!=-1){
                                      if(page == "popularview"){
                                        Get.back();
                                      }else{
                                        Get.toNamed(Routes.getPopularFood(popularIndex));
                                      }
                                    }else{
                                      var recommendedIndex = Get.find<RecommendedController>().recommendedProductList.indexOf(_cartList[index].product!);
                                      if(page == "recommendedview"){
                                        Get.back();
                                      }else{
                                        Get.toNamed(Routes.getRecommendedFood(recommendedIndex));
                                      }
                                    }
                                  },
                                  child: Container(
                                    height: Dimensions.height20 * 5,
                                    width: Dimensions.height20 * 5,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                                        color: Colors.orange,
                                        image: DecorationImage(
                                          image: AssetImage("assets/images/food3.jpg"),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                                SizedBox(width: Dimensions.width10),
                                Expanded(
                                  child: Container(
                                    height: Dimensions.height20 * 5,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        bigText('${cartItem.product.name}'),
                                        smallText('Spyce',
                                            size: Dimensions.font10),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            bigText(
                                                "\$ ${cartItem.product.price}",
                                                color: Colors.redAccent),
                                            Container(
                                              padding: EdgeInsets.all(Dimensions.height5),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(Dimensions.border10),
                                                color: Colors.white,
                                              ),
                                              child: Row(children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    controller.decrementQuantityItem(index);
                                                  },
                                                  child: Icon(Icons.remove, color: AppColors.signColor),
                                                ),
                                                SizedBox(width: Dimensions.width10 / 2),
                                                bigText("${cartItem.quantity}"),
                                                SizedBox(width: Dimensions.width10 / 2),
                                                GestureDetector(
                                                  onTap: () {
                                                    controller.incrementQuantityItem(index);
                                                  },
                                                  child: Icon(Icons.add, color: AppColors.signColor),
                                                ),
                                              ]),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }),
              ) : EmptyCartView())
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: Dimensions.bottomHeightBar,
          padding: EdgeInsets.symmetric(horizontal: Dimensions.height20),
          decoration: BoxDecoration(
            color: AppColors.buttonBackgroudColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius20 * 2),
              topRight: Radius.circular(Dimensions.radius20 * 2),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: Dimensions.height20,
                    horizontal: Dimensions.width40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                ),
                child: Obx(()=> bigText("\$ ${cartController.totalAmount}"))
              ),
              GestureDetector(
                onTap: () {
                  //controller.addItem(product);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width20,
                      vertical: Dimensions.width20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.mainColor,
                  ),
                  child: bigText("Check out", color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
