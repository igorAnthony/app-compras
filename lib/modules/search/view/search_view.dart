import 'package:eisteintaste/global/constant/colors.dart';
import 'package:eisteintaste/global/constant/dimensions.dart';
import 'package:eisteintaste/global/widgets/app_icon.dart';
import 'package:eisteintaste/global/widgets/text.dart';
import 'package:eisteintaste/models/products_model.dart';
import 'package:eisteintaste/modules/search/controller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(Dimensions.width20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.maxFinite,
                height: Dimensions.height45,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.width15),
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 0.5,
                        blurRadius: 4,
                      )
                    ]
                  ),
                  child: TextField(
                    controller: Get.find<SearchProductController>().searchController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      prefixIcon: Icon(Icons.search, color: AppColors.mainColor,),
                      contentPadding: EdgeInsets.only(left: Dimensions.width20, top: Dimensions.height10),
                      suffixIcon: Obx(() => Get.find<SearchProductController>().isSearch.value ? IconButton(
                        onPressed: () {
                          Get.find<SearchProductController>().reset();
                        },
                        icon: Icon(Icons.close, color: AppColors.mainColor, size: Dimensions.iconSize16,)
                      ) : SizedBox()
                    )),
                    onSubmitted: (value) {
                      Get.find<SearchProductController>().search(value);
                    },
                  ),
                ),
              ),
              SizedBox(height: Dimensions.height20),
              Obx(() => Get.find<SearchProductController>().isSearch.value ? Expanded(
                child: SingleChildScrollView(
                  child: GetBuilder<SearchProductController>(
                    init: Get.find<SearchProductController>(),
                    builder: (controller) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.searchList.length,
                        itemBuilder: (context, index) {
                          Products product = controller.searchList[index];
                          return Container(
                            margin: EdgeInsets.only(bottom: Dimensions.height10),
                            child: Row(
                              children: [
                                Container(
                                  width: Dimensions.width50,
                                  height: Dimensions.width50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(Dimensions.width15),
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/food1.jpg'),
                                      fit: BoxFit.cover
                                    )
                                  ),
                                ),
                                SizedBox(width: Dimensions.width10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    smallText('${product.name}', weight: FontWeight.bold, size: Dimensions.font16),
                                  ],
                                )
                              ],
                            ),
                          );
                        }
                      );
                    },
                  ),
                ),
              ) : Expanded(
                child: Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        smallText('Search your favourite food', size: Dimensions.font18, weight: FontWeight.bold),
                      ],
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
      )
    );
  }
}