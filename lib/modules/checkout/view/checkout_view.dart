import 'package:eisteintaste/global/constant/colors.dart';
import 'package:eisteintaste/global/constant/dimensions.dart';
import 'package:eisteintaste/global/widgets/app_icon.dart';
import 'package:eisteintaste/global/widgets/text.dart';
import 'package:eisteintaste/modules/checkout/controller/checkout_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Checkout", style: TextStyle(
          color: Colors.white,
          fontSize: Dimensions.font18
        )),
        backgroundColor: AppColors.mainColor,
        leading: Container(
          padding: EdgeInsets.only(left: Dimensions.width10),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Center(
              child: smallText("Cancel", color:Colors.white, size: Dimensions.font16)
            ),
          )
        )
      ),
      body: Column(
        children: [
          Container(
            height: 60,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: AppColors.backgroundColor2,
              border: Border(
                bottom: BorderSide(
                  color: AppColors.blackColorWithOpacity,
                  width: 0.6
                )
              )
            ),
            child: Center(
              child: GetBuilder<CheckOutController>(
                init: Get.find<CheckOutController>(),
                builder: (controller) {
                  return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: Get.find<CheckOutController>().checkOutPages.length,
                    itemBuilder: (context, index){
                      return Container(
                        margin: EdgeInsets.only(left: index == 0 ? 0 : Dimensions.width10),
                        child: Row(
                          children: [
                            index < controller.checkOutIndex ? 
                              appIcon(
                                Icons.check, 
                                size: Dimensions.height25, 
                                iconSize: Dimensions.iconSize16, 
                                backgroundColor: AppColors.iconColor6,
                                iconColor: Colors.white) : 
                              appText(
                                '${index + 1}', 
                                size: Dimensions.height25, 
                                textColor: Colors.white, 
                                backgroundColor: controller.checkOutIndex == index ? AppColors.mainBlackColor :  Theme.of(context).disabledColor),
                            SizedBox(width: Dimensions.width10,),
                            smallText(controller.checkOutPageNames[index], 
                              color: controller.checkOutIndex == index ?  AppColors.mainBlackColor : controller.checkOutIndex > index ? AppColors.mainBlackColor : Theme.of(context).disabledColor,
                              size: Dimensions.font14,
                              weight: FontWeight.bold
                            ),
                            SizedBox(width: Dimensions.width10,),
                            index < controller.checkOutPages.length - 1 ? smallText('-', size: 30) : SizedBox(),
                          ],
                        ),
                      );
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: GetBuilder<CheckOutController>(
              init: Get.find<CheckOutController>(),
              builder: (controller) {
                return controller.checkOutPages[controller.checkOutIndex];
              },
            ),
          ),
        ],
      )
    );
  }
}