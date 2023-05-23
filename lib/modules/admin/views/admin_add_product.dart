import 'package:app_compras/global/constant/colors.dart';
import 'package:app_compras/global/constant/decoration.dart';
import 'package:app_compras/global/constant/dimensions.dart';
import 'package:app_compras/global/widgets/app_icon.dart';
import 'package:app_compras/modules/admin/controller/admin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminProductDetailsView extends GetView<AdminController>{
  final int pageId;

  AdminProductDetailsView({required this.pageId});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(left: Dimensions.width20, top: Dimensions.height20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap:() { 
                        Get.back();
                      },
                      child: appIcon(Icons.arrow_back_ios, backgroundColor: AppColors.iconColor1)),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: Dimensions.profileImgSize,
                      width: Dimensions.profileImgSize,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.iconColor1,
                      ),
                      child: Icon(Icons.person, size: 50,color: Colors.white,),
                    ),
                    SizedBox(height: Dimensions.height40),
                    kMaterialDecoration(
                      borderRadius: Dimensions.border10,
                      TextFormField(
                        keyboardType: TextInputType.name,
                        enableSuggestions: false,
                        autocorrect: false,
                        //validator: (val) => val!.isEmpty ? 'Invalid name' : null,
                        decoration: kInputDecoration('Food name', Icons.fastfood, iconColor: AppColors.iconColor1),
                      ),
                    ),
                    SizedBox(height: Dimensions.height20),
                    kMaterialDecoration(
                      borderRadius: Dimensions.border10,
                      TextFormField(
                        keyboardType: TextInputType.multiline,
                        enableSuggestions: false,
                        autocorrect: false,
                        textAlign: TextAlign.left,
                        maxLines: 3,
                        //validator: (val) => val!.isEmpty ? 'Invalid name' : null,
                        decoration: kInputDecoration('Description', Icons.fastfood, iconColor: AppColors.iconColor1),
                      ),
                    ),
                ],
                        ),
              ),
          ]),
        )
      ) 
    );
  }
}
