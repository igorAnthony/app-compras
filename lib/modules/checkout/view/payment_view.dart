import 'package:eisteintaste/global/constant/colors.dart';
import 'package:eisteintaste/global/constant/dimensions.dart';
import 'package:eisteintaste/global/widgets/app_icon.dart';
import 'package:eisteintaste/global/widgets/payment_widgets.dart';
import 'package:eisteintaste/global/widgets/text.dart';
import 'package:eisteintaste/modules/checkout/controller/checkout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Dimensions.height20),
                bigText("Choose a payment method", weight: FontWeight.w400, size: Dimensions.font24),
                SizedBox(height: Dimensions.height10),
                smallText("You will not be charged until you review this order on the next page.", size: Dimensions.font14, color: Colors.grey.withOpacity(0.8)),
                SizedBox(height: Dimensions.height20),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: Get.find<CheckOutController>().paymentOptionsNames.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder:(context, index) {
                    CheckOutController controller = Get.find<CheckOutController>();
                    return Row(
                      children: [
                        Obx(
                          () => Radio(
                            value: index,
                            groupValue: controller.paymentOptionsIndex.value,
                            onChanged: (value) => controller.setPaymentOptionsIndex(index),
                          ),
                        ),
                        Icon(controller.paymentOptionsIcons[index], size: Dimensions.iconSize24),
                        SizedBox(width: Dimensions.width10),
                        smallText(controller.paymentOptionsNames[index], size: Dimensions.font14, weight: FontWeight.bold)
                      ],
                    );
                  }
                ),
                Obx(() => Expanded(child: Get.find<CheckOutController>().paymentOptionsIndex.value != 1 ?  Container() : creditCardFields()))
              ],
            ),
          ),
          bottomNavigationBar: GetBuilder<CheckOutController>(
            builder: (controller) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: Dimensions.height10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.setPagesIndex(controller.checkOutIndex + 1);
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
              );
          },
        ),
      ),
    );
  }
}