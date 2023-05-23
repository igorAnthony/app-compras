import 'package:app_compras/global/constant/colors.dart';
import 'package:app_compras/global/constant/dimensions.dart';
import 'package:app_compras/global/widgets/text.dart';
import 'package:flutter/material.dart';

InputDecoration kInputDecoration(String label, IconData icon, {Color? iconColor}) {
  return InputDecoration(
    labelText: label,
    prefixIcon: Icon(icon, color: iconColor ?? AppColors.mainColor),
    contentPadding: EdgeInsets.symmetric(horizontal:Dimensions.height10, vertical: Dimensions.width20),
    border: const OutlineInputBorder(
        borderSide: BorderSide.none
    ),
    floatingLabelBehavior: FloatingLabelBehavior.never,
  );
}

InputDecoration kInputDecorationDescription(String label, IconData icon, {Color? iconColor}) {
  return InputDecoration(
    labelText: label,
    prefixIcon: Icon(icon, color: iconColor ?? AppColors.mainColor),
    contentPadding: EdgeInsets.symmetric(horizontal:Dimensions.height10, vertical: Dimensions.width20),
    border: const OutlineInputBorder(
        borderSide: BorderSide.none
    ),
    floatingLabelBehavior: FloatingLabelBehavior.never,
  );
}
Material kMaterialDecoration(Widget textFormField, {double? borderRadius}) {
  if(borderRadius == null){
    borderRadius = Dimensions.border30;
  }
  return Material(
    elevation: Dimensions.height5,
    borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
    shadowColor: Colors.white,
    child: textFormField,
  );
}

TextButton kTextButton(String label, Function onPressed) {
  return TextButton(
    onPressed: () => onPressed(),
    style: ButtonStyle(
      backgroundColor: MaterialStateColor.resolveWith((states) => (AppColors.mainColor)),
      padding: MaterialStateProperty.resolveWith((states) => EdgeInsets.symmetric(vertical: 15, horizontal: 50)),
      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25)
        )
      ),
    ),
    child: bigText(label, color: Colors.white, size: Dimensions.font26)
  );
}

Row kLoginOrRegisterHint(String text, String label, Function onTap) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      smallText(text, size: Dimensions.font18, color: AppColors.blackColorWithOpacity),
      GestureDetector(
        child: bigText(label, size: Dimensions.font18, weight: FontWeight.bold),
        onTap: () => onTap(),
      )
    ],
  );
}

Expanded kLikeAndComment(
    int value, IconData icon, Color color, Function onTap) {
  return Expanded(
      child: Material(
    child: InkWell(
      onTap: () => onTap(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 16, color: color),
            const SizedBox(
              width: 4,
            ),
            Text('$value'),
          ],
        ),
      ),
    ),
  ));
}
