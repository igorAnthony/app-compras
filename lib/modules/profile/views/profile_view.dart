import 'package:eisteintaste/global/constant/colors.dart';
import 'package:eisteintaste/global/constant/dimensions.dart';
import 'package:eisteintaste/global/constant/route.dart';
import 'package:eisteintaste/global/widgets/profile_container.dart';
import 'package:eisteintaste/global/widgets/text.dart';
import 'package:eisteintaste/models/user.dart';
import 'package:eisteintaste/modules/address/controller/address_controller.dart';
import 'package:eisteintaste/modules/profile/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    User user = Get.find<UserController>().user;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
              profileTextFields("${user.name}", Icons.location_history_rounded, AppColors.mainColor),
              SizedBox(height: Dimensions.height20),
              profileTextFields("${user.phone_number ?? "Add here phone number"}", Icons.phone, AppColors.iconColor1),
              SizedBox(height: Dimensions.height20),
              profileTextFields("${user.email}", Icons.alternate_email, AppColors.iconColor1),
              SizedBox(height: Dimensions.height20),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.addAddressRoute);
                },
                child: profileTextFields(Get.find<AddressController>().addressList.isEmpty ? "Fill your address" : "Address", Icons.map, AppColors.iconColor1)
              ),
              SizedBox(height: Dimensions.height40),
              GestureDetector(
                onTap: () {
                  Get.find<UserController>().logOut();
                  if(Get.find<UserController>().isLogged){
                    Get.offAllNamed(Routes.loginRoute);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout, color: AppColors.mainColor, size: Dimensions.iconSize16,),
                    SizedBox(width: Dimensions.width10),
                    smallText("Log out", color: AppColors.mainColor),
                  ],
                )
              ),
            ],
          ),
        )
      ),
    );
  }
}