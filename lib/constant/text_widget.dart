import 'package:app_compras/constant/colors.dart';
import 'package:flutter/material.dart';

Text bigText(String label, {Color? color, double? size, TextOverflow? overflow}){
  return Text(
    label, 
    style: TextStyle(
      color: color ?? AppColors.mainBlackColor,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: size ?? 20,
      overflow: overflow ?? TextOverflow.ellipsis
    ),
    maxLines: 1,
  );
}

Text smallText(String label, {double? height, Color? color, double? size}){
  return Text(
    label, 
    style: TextStyle(
      color: color ?? AppColors.textColor,
      fontFamily: 'Roboto',
      fontSize: size ?? 12,
      height: height ?? 1.2,
    )
  );
}