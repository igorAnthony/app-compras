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
              return GestureDetector(
                onTap: () {
                  controller.setPagesIndex(controller.checkOutIndex + 1);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: Dimensions.height10, horizontal: Dimensions.width10),
                  width: double.maxFinite,
                  height: Dimensions.height45,
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(Dimensions.radius10)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      bigText("Select and continue",  size: Dimensions.font20, color: Colors.white),
                      SizedBox(width: Dimensions.width5),
                      Icon(Icons.arrow_forward_ios, size: Dimensions.iconSize16, color: Colors.white)
                    ],
                  ),
                ),
              );
          },
        ),
      ),
    );
  }
}