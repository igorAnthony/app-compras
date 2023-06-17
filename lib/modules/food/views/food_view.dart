import 'package:eisteintaste/global/widgets/text.dart';
import 'package:eisteintaste/global/constant/colors.dart';
import 'package:eisteintaste/global/constant/dimensions.dart';
import 'package:eisteintaste/modules/food/views/food_body_view.dart';
import 'package:flutter/material.dart';

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
        body: Column(
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
                  )
                ],
              ),
            ),
            Expanded(child: SingleChildScrollView(child: FoodBodyView())),
          ],
        ),
      ),
    );
  }
}
