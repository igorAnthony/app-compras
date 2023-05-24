import 'package:app_compras/global/constant/colors.dart';
import 'package:app_compras/global/constant/dimensions.dart';
import 'package:flutter/material.dart';

Text bigText(String label,
    {Color? color, double? size, TextOverflow? overflow, FontWeight? weight,}) {
  return Text(
    label,
    style: TextStyle(
      
        color: color ?? AppColors.mainBlackColor,
        fontFamily: 'Roboto',
        fontWeight: weight ?? FontWeight.w400,
        fontSize: size ?? Dimensions.font18,
        overflow: overflow ?? TextOverflow.ellipsis, 
        ),
    maxLines: 1,
  );
}

Text smallText(String label, {double? height, Color? color, double? size, FontWeight? weight, TextAlign? textAlign}) {
  return Text(label,
      textAlign: textAlign ?? TextAlign.start,
      style: TextStyle(
        color: color ?? AppColors.textColor,
        fontFamily: 'Roboto',
        fontSize: size ?? Dimensions.font12,
        fontWeight: weight ?? FontWeight.w400,
        height: height ?? Dimensions.fontHeight012,
      ));
}
