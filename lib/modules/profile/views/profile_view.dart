import 'package:app_compras/global/constant/colors.dart';
import 'package:app_compras/global/constant/dimensions.dart';
import 'package:app_compras/global/widgets/profile_container.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          height: Dimensions.screenHeight,
          margin: EdgeInsets.symmetric(vertical: Dimensions.height10, horizontal: Dimensions.height20),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: Dimensions.profileImgSize,
                width: Dimensions.profileImgSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.mainColor,
                ),
                child: Icon(Icons.person, size: 50,color: Colors.white,),
              ),
              SizedBox(height: Dimensions.height40),
              profileTextFields("Igor", Icons.location_history_rounded, AppColors.mainColor),
              SizedBox(height: Dimensions.height20),
              profileTextFields("45991479103", Icons.phone, AppColors.iconColor1),
              SizedBox(height: Dimensions.height20),
              profileTextFields("info@dbestech.com", Icons.alternate_email, AppColors.iconColor1),
              SizedBox(height: Dimensions.height20),
              profileTextFields("Address", Icons.map, AppColors.iconColor1),
              SizedBox(height: Dimensions.height20),
              profileTextFields("none", Icons.chat_rounded, Colors.redAccent),
              SizedBox(height: Dimensions.height20),
              profileTextFields("Log out", Icons.logout, Colors.redAccent),
            ],
          ),
        )
      ),
    );
  }
}