import 'package:eisteintaste/global/constant/colors.dart';
import 'package:eisteintaste/global/constant/dimensions.dart';
import 'package:eisteintaste/global/widgets/text.dart';
import 'package:eisteintaste/models/address_model.dart';
import 'package:eisteintaste/models/products_model.dart';
import 'package:eisteintaste/modules/address/controller/address_controller.dart';
import 'package:eisteintaste/modules/cart/controller/cart_controller.dart';
import 'package:eisteintaste/modules/cart/model/cart_model.dart';
import 'package:eisteintaste/modules/profile/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
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
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: Dimensions.width20, vertical: Dimensions.height20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              bigText("Order Summary"),
              SizedBox(height: Dimensions.height40),
              
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(bottom: Dimensions.height10),
                    padding: EdgeInsets.only(bottom: Dimensions.height10),
                    child: bigText("Items", color: Colors.grey),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: const Color.fromARGB(255, 204, 202, 202).withOpacity(0.3),
                          width: 1
                        ),
                      ),
                    ),
                  ),
                  GetBuilder<CartController>(
                    init: Get.find<CartController>(),
                    builder: (cartController){
                      return Container(
                        margin: EdgeInsets.only(bottom: Dimensions.height10),
                        child: ListView.builder(
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                  smallText('\$$total}', color: Colors.black, size: Dimensions.font12)
                                ],
                              ),
                            );
                          },
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: const Color.fromARGB(255, 204, 202, 202).withOpacity(0.3),
                              width: 1
                            ),
                          ),
                        ),
                      );
                    }
                  ),
                ]
              ),
              Container(
                padding: EdgeInsets.only(bottom: Dimensions.height10),
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    bigText("To: "),
                    SizedBox(height: Dimensions.height5),
                    smallText(name, size: Dimensions.font16),
                    SizedBox(height: Dimensions.height3),
                    smallText("$addressText", size: Dimensions.font16),
                    SizedBox(height: Dimensions.height3),
                    smallText("Contact number: $contact", size: Dimensions.font16),
                  ],
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: const Color.fromARGB(255, 204, 202, 202).withOpacity(0.3),
                      width: 1
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: Dimensions.height10),
                padding: EdgeInsets.symmetric(vertical: Dimensions.height10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    bigText("Total"),
                    bigText("\$${Get.find<CartController>().totalAmount}")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GetBuilder<AddressController>(
        builder: (addressController) {
          return Container(
            height: Dimensions.height110,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20),
                topRight: Radius.circular(Dimensions.radius20),
              ),
            ),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: Dimensions.height20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: Dimensions.height15, horizontal: Dimensions.width40),
                      child:  bigText("Confirm",  size: Dimensions.font24, color: Colors.white),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
      },),
    );
  }
}