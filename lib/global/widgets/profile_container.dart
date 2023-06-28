import 'package:eisteintaste/global/constant/decoration.dart';
import 'package:eisteintaste/global/constant/dimensions.dart';
import 'package:eisteintaste/global/widgets/text.dart';
import 'package:flutter/material.dart';

Container profileTextFields(String label, IconData icon, Color colorBackgroundIcon){
  return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: Dimensions.width10, vertical: Dimensions.height10),
      decoration: boxDecorationWithBoxShadow(borderRadius: Dimensions.radius10),
      child: Row(
        children: [
          Container(
            width: Dimensions.profileIconSize,
            height: Dimensions.profileIconSize,
            child: Icon(icon, color: Colors.white, size: Dimensions.iconSize24,),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorBackgroundIcon,
            ),
          ),
          SizedBox(width: Dimensions.width20),
          bigText("${label}", size: Dimensions.font20),
        ],
      ),
    );
}