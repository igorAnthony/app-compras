import 'package:eisteintaste/global/constant/dimensions.dart';
import 'package:flutter/material.dart';

Container appIcon(IconData icon,
    {double? size,
    Color? backgroundColor,
    Color? iconColor,
    double? iconSize}) {
  var radius = size ?? Dimensions.height40;
  radius /= 2;
  return Container(
    width: size ?? Dimensions.height40,
    height: size ?? Dimensions.height40,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      color: backgroundColor ?? Color(0xFFfcf4e4),
    ),
    child: Icon(
      icon,
      color: iconColor ?? Color(0xFF756d54),
      size: iconSize ?? Dimensions.iconSize16,
    ),
  );
}
