import 'package:eisteintaste/global/constant/colors.dart';
import 'package:eisteintaste/global/constant/dimensions.dart';
import 'package:eisteintaste/global/widgets/text.dart';
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
Material buildMaterialDecoration<T extends Widget>(T child, {double? borderRadius, double? sizeMax, double? heightElevation}) {
  return Material(
    shadowColor: Colors.white,
    elevation: heightElevation??Dimensions.height3,
    borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? Dimensions.radius20)),
    
    child: Container(
      width: sizeMax ?? double.maxFinite,
      child: child,
      color: Colors.white,
    ),
  );
}
BoxDecoration boxDecorationWithBoxShadow({double? borderRadius, double? spreadRadius, double? blurRadius, Color? shadowColor, Color? color}) {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(borderRadius ?? Dimensions.radius20),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: spreadRadius ?? 1,
        blurRadius: blurRadius ?? 4,
      )
    ]
  );
}
TextField appTextField(TextEditingController textController, String label, IconData iconData){
  return TextField(
    controller: textController,
    decoration: kInputDecoration(label, iconData),
  );
}

TextButton kTextButton(String label, Function onPressed, {Color? backgroundColor, double? fontSize}) {
  return TextButton(
    onPressed: () => onPressed(),
    style: ButtonStyle(
      backgroundColor: MaterialStateColor.resolveWith((states) => (backgroundColor ?? AppColors.mainColor)),
      padding: MaterialStateProperty.resolveWith((states) => EdgeInsets.symmetric(vertical: 15, horizontal: 50)),
      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25)
        )
      ),
    ),
    child: bigText(label, color: Colors.white, size: fontSize ?? Dimensions.font26)
  );
}

Row kLoginOrRegisterHint(String text, String label, Function onTap) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      smallText(text, size: Dimensions.font18, color: Colors.white.withOpacity(0.3)),
      GestureDetector(
        child: bigText(label, size: Dimensions.font18, weight: FontWeight.bold, color: Colors.white.withOpacity(0.5)),
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
