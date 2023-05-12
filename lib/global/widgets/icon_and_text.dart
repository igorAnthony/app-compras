import 'package:app_compras/global/widgets/text.dart';
import 'package:app_compras/global/constant/dimensions.dart';
import 'package:flutter/material.dart';

Row iconAndTextWidget(String label, IconData icon, Color? iconColor,
    {double? size}) {
  return Row(
    children: [
      Icon(
        icon,
        color: iconColor,
        size: size ?? Dimensions.iconSize24,
      ),
      SizedBox(width: 5),
      smallText(label),
    ],
  );
}
