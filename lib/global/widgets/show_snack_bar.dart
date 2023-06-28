import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showMessageSnackbarBottom(String message){
  Get.showSnackbar(
    GetSnackBar(
      message: message,
      duration: const Duration(seconds: 1),
    ),
  );
}
void showMessageTop(String typeMessage, String message, {Color? colorText, Color? backgroundColor, Icon? icon}){
  Get.snackbar(
    typeMessage,
    message,
    colorText: colorText ?? Colors.white,
    backgroundColor: backgroundColor ?? Colors.redAccent,
    icon: icon ?? const Icon(Icons.add_alert),
  );
}