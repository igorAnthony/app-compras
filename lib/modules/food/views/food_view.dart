import 'package:eisteintaste/global/constant/route.dart';
import 'package:eisteintaste/global/widgets/text.dart';
import 'package:eisteintaste/global/constant/colors.dart';
import 'package:eisteintaste/global/constant/dimensions.dart';
import 'package:eisteintaste/modules/food/views/food_body_view.dart';
import 'package:eisteintaste/modules/profile/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodView extends StatefulWidget {
  const FoodView({super.key});

  @override
  State<FoodView> createState() => _FoodViewState();
}

class _FoodViewState extends State<FoodView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<UserController>(
          init: Get.find<UserController>(),
          builder:(controller) {
            return controller.isLogged ? Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      bottom: Dimensions.height20, top: Dimensions.height10),
                  padding: EdgeInsets.only(
                      left: Dimensions.width20, right: Dimensions.width20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          bigText('Paraná', color: AppColors.mainColor),
                          Row(
                            children: [
                              smallText("Toledo",
                                  color: AppColors.blackColorWithOpacity),
                              Icon(
                                Icons.arrow_drop_down_rounded,
                                size: Dimensions.width15,
                              )
                            ],
                          )
                        ],
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.searchRoute);
                          },
                          child: Container(
                            height: Dimensions.height45,
                            width: Dimensions.height45,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.width15),
                                color: AppColors.mainColor),
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                              size: Dimensions.iconSize24,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                
                Expanded(child: SingleChildScrollView(child: FoodBodyView())) 
              ]): Container(child: Center(child: CircularProgressIndicator()));
          },
        ),
        
      ),
    );
  }
}
