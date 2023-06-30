import 'package:eisteintaste/global/constant/colors.dart';
import 'package:eisteintaste/global/constant/dimensions.dart';
import 'package:eisteintaste/global/widgets/text.dart';
import 'package:eisteintaste/models/address_model.dart';
import 'package:eisteintaste/models/products_model.dart';
import 'package:eisteintaste/modules/address/controller/address_controller.dart';
import 'package:eisteintaste/modules/cart/controller/cart_controller.dart';
import 'package:eisteintaste/modules/cart/model/cart_model.dart';
import 'package:eisteintaste/modules/checkout/controller/checkout_controller.dart';
import 'package:eisteintaste/modules/profile/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ReviewView extends StatefulWidget {
  const ReviewView({super.key});

  @override
  State<ReviewView> createState() => _ReviewViewState();
}

class _ReviewViewState extends State<ReviewView> {
  String name = "";
  String addressText = "";
  String contact = "";

  @override
  Widget build(BuildContext context) {
    Address address = Get.find<AddressController>().addressList[Get.find<AddressController>().addressTypeIndex];
    name = address.contactPersonName == "" ? Get.find<UserController>().user.name! : address.contactPersonName;
    addressText = address.address;
    contact = address.contactPersonNumber == "" ? Get.find<UserController>().user.phoneNumber! : address.contactPersonNumber;
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Expanded(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: Dimensions.width20, vertical: Dimensions.height20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  bigText("Please confirm and submit your order", weight: FontWeight.w500),
                  SizedBox(height: Dimensions.height20),
                  Container(
                    padding: EdgeInsets.only(bottom: Dimensions.height10),
                    width: double.maxFinite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(Dimensions.width15),
                          decoration: BoxDecoration(
                            color: AppColors.backgroundColor2,
                            borderRadius: BorderRadius.circular(Dimensions.radius10),
                            border: Border.all(
                              color: const Color.fromARGB(255, 204, 202, 202).withOpacity(0.3),
                              width: 1
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  bigText("Shipping address"),
                                  bigText("Edit", size: Dimensions.font14, color: AppColors.mainColor)
                                ],
                              ),
                              SizedBox(height: Dimensions.height15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  bigText("Name", color: Colors.grey.withOpacity(0.7), size: Dimensions.font18),
                                  smallText(name, size: Dimensions.font18, weight: FontWeight.bold, color: Colors.grey),
                                ],
                              ),
                              SizedBox(height: Dimensions.height10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  bigText("Street", color: Colors.grey.withOpacity(0.7), size: Dimensions.font18),
                                  smallText("$addressText", size: Dimensions.font18, weight: FontWeight.bold, color: Colors.grey),
                                ],
                              ),
                              SizedBox(height: Dimensions.height10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  bigText("Contact", color: Colors.grey.withOpacity(0.7), size: Dimensions.font18),
                                  smallText("$contact", size: Dimensions.font18, weight: FontWeight.bold, color: Colors.grey),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: Dimensions.height20),
                        Container(
                          padding: EdgeInsets.all(Dimensions.width15),
                          decoration: BoxDecoration(
                            color: AppColors.backgroundColor2,
                            borderRadius: BorderRadius.circular(Dimensions.radius10),
                            border: Border.all(
                              color: const Color.fromARGB(255, 204, 202, 202).withOpacity(0.3),
                              width: 1
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  bigText("Payment"),
                                  bigText("Edit", size: Dimensions.font14, color: AppColors.mainColor)
                                ],
                              ),
                              SizedBox(height: Dimensions.height15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  bigText("Method", color: Colors.grey.withOpacity(0.7), size: Dimensions.font18),
                                  smallText(Get.find<CheckOutController>().paymentOptionsNames[Get.find<CheckOutController>().paymentOptionsIndex.value], size: Dimensions.font18, weight: FontWeight.bold, color: Colors.grey),
                                ],
                              ),
                              
                            ],
                          ),
                        ),
                        SizedBox(height: Dimensions.height20),
                        Container(
                          padding: EdgeInsets.all(Dimensions.width15),
                          decoration: BoxDecoration(
                            color: AppColors.backgroundColor2,
                            borderRadius: BorderRadius.circular(Dimensions.radius10),
                            border: Border.all(
                              color: const Color.fromARGB(255, 204, 202, 202).withOpacity(0.3),
                              width: 1
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  bigText("Items"),
                                  bigText("Edit", size: Dimensions.font14, color: AppColors.mainColor)
                                ],
                              ),
                              SizedBox(height: Dimensions.height15),
                              GetBuilder<CartController>(
                                init: Get.find<CartController>(),
                                builder: (cartController){
                                  return ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: cartController.cartList.length,
                                    itemBuilder: (context, index) {
                                      Cart cart = cartController.cartList[index];
                                      Products product = cart.product;
                                      double total = cart.quantity * product.price!;
                                      return Container(
                                        margin: EdgeInsets.only(bottom: Dimensions.height10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: Dimensions.listViewImgSizeOrders,
                                                  width:Dimensions.listViewImgSizeOrders,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(
                                                        Dimensions.radius10),
                                                    color: Colors.orange,
                                                  ),
                                                ),
                                                SizedBox(width: Dimensions.width10),
                                                smallText('${cart.quantity}x ${product.name}', color: Colors.black, size: Dimensions.font12)
                                              ],
                                            ),
                                            smallText('\$$total', color: Colors.black, size: Dimensions.font12)
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                }
                              ),
                              
                            ],
                          ),
                        ),
                      ],
                    ),
                    
                  ),
                  
                  
                  
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(Dimensions.width20),
        width: double.maxFinite,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 1,
              offset: Offset(0, 0),
            )
          ],
          border: Border(
            top: BorderSide(
              color: Colors.grey.withOpacity(0.2),
              width: 1
            )
          )
        ),
        child: GetBuilder<AddressController>(
          builder: (addressController) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.all(Dimensions.width20),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor2,
                    borderRadius: BorderRadius.circular(Dimensions.radius10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: Offset(0, 0),
                      )
                    
                    ]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      bigText("Order Summary", size: Dimensions.font20, color: Colors.black, weight: FontWeight.w500),
                      SizedBox(height: Dimensions.height20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          bigText("Subtotal", size: Dimensions.font18, color: Colors.grey),
                          bigText("\$ ${Get.find<CartController>().totalAmount}", size: Dimensions.font14)
                        ],
                      ),
                      SizedBox(height: Dimensions.height20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          bigText("Delivery", size: Dimensions.font18, color: Colors.grey),
                          bigText("\$ 0.0", size: Dimensions.font14)
                        ],
                      ),
                      SizedBox(height: Dimensions.height20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          bigText("Total", size: Dimensions.font18, color: Colors.grey),
                          bigText("\$ ${Get.find<CartController>().totalAmount}", size: Dimensions.font14)
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Dimensions.height10),
                GestureDetector(
                  onTap: () {
                    Get.find<CartController>().cartCheckOut();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: Dimensions.height15),
                    width: double.maxFinite,
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        bigText("Submit Order",  size: Dimensions.font20, color: Colors.white),
                        SizedBox(width: Dimensions.width5),
                        Icon(Icons.arrow_forward_ios, size: Dimensions.iconSize16, color: Colors.white)
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor,
                    ),
                  ),
                ),
              ],
            );
        },),
      ),
    );
  }
}