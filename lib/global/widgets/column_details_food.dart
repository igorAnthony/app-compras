import 'package:eisteintaste/global/constant/colors.dart';
import 'package:eisteintaste/global/constant/dimensions.dart';
import 'package:eisteintaste/global/widgets/icon_and_text.dart';
import 'package:eisteintaste/global/widgets/text.dart';
import 'package:flutter/material.dart';

Column columnDetailsFood(String label, {double? sizeLabel}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      bigText(label, size: sizeLabel),
      SizedBox(height: Dimensions.height10),
      Row(
        children: [
          Wrap(
            children: List.generate(
                5,
                (index) => Icon(
                      Icons.star,
                      color: AppColors.mainColor,
                      size: 14,
                    )),
          ),
          SizedBox(width: Dimensions.width10),
          smallText("4.5"),
          SizedBox(width: Dimensions.width10),
          smallText("1285 comments"),
        ],
      ),
      SizedBox(height: Dimensions.height20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          iconAndTextWidget("Normal", Icons.circle_sharp, AppColors.iconColor1),
          iconAndTextWidget("1.7km", Icons.location_on, AppColors.mainColor),
          iconAndTextWidget(
              "32min", Icons.access_time_rounded, AppColors.iconColor2),
        ],
      ),
    ],
  );
}
