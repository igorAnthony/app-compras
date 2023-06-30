import 'package:eisteintaste/global/constant/dimensions.dart';
import 'package:eisteintaste/global/widgets/text.dart';
import 'package:eisteintaste/modules/checkout/controller/checkout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Column creditCardFields(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      smallText("Name on card", color: Colors.black, size: Dimensions.font16, weight: FontWeight.w400),
      SizedBox(height: Dimensions.height5),
      creditCardField(),
      SizedBox(height: Dimensions.height20),
      smallText("Card number", color: Colors.black, size: Dimensions.font16, weight: FontWeight.w400),
      SizedBox(height: Dimensions.height5),
      creditCardField(),
      SizedBox(height: Dimensions.height20),
      Row(
        children: [
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              smallText("Expiration date", color: Colors.black, size: Dimensions.font16, weight: FontWeight.w400),
              SizedBox(height: Dimensions.height5),
              creditCardField(hintText:'MM/YY'),
            ],
          )),
          SizedBox(width: Dimensions.width15),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              smallText("Security code", color: Colors.black, size: Dimensions.font16, weight: FontWeight.w400),
              SizedBox(height: Dimensions.height5),
              creditCardField(hintText:'CVV'),
            ],
          ))
        ],
      ),
      SizedBox(height: Dimensions.height10),
      Obx(
        () => Row(
          children: [
            Checkbox(value: Get.find<CheckOutController>().isMarked.value, onChanged: (bool? value) {
              Get.find<CheckOutController>().setMarked(value!);
            }),
            smallText("Save this card for future purchases", color: Colors.black, size: Dimensions.font16, weight: FontWeight.w400),
          ],
        ),
      )
    ],
  );
}
//TextEditingController controller
TextField creditCardField( {String? hintText, TextEditingController? controller}){
  return TextField(
    textAlign: TextAlign.start,
    decoration: InputDecoration(
      hintText: hintText ?? 'Enter here',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(Dimensions.radius10),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: Dimensions.width5, horizontal: Dimensions.width10),
    ),
    style: TextStyle(
      fontSize: 14,
    ),
  );
}
