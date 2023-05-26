import 'package:app_compras/global/constant/colors.dart';
import 'package:app_compras/global/constant/dimensions.dart';
import 'package:app_compras/global/constant/route.dart';
import 'package:app_compras/global/widgets/app_icon.dart';
import 'package:app_compras/global/widgets/text.dart';
import 'package:app_compras/models/products_model.dart';
import 'package:app_compras/models/category_model.dart';
import 'package:app_compras/modules/admin/controller/admin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminPanelView extends StatefulWidget{
  const AdminPanelView({super.key});

  @override
  State<AdminPanelView> createState() => _AdminPanelViewState();
}

class _AdminPanelViewState extends State<AdminPanelView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
              margin: EdgeInsets.symmetric(vertical: Dimensions.height10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  Row(
                    children: [
                      bigText("Admin settings", size: 24, weight: FontWeight.bold),
                      SizedBox(width: Dimensions.width10),
                      Icon(Icons.admin_panel_settings, color: AppColors.iconColor1),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.getAdminProductDetailsView(null, "Item Registration"));
                    },
                    child: appIcon(Icons.add, backgroundColor: AppColors.iconColor1, iconSize: Dimensions.iconSize24, iconColor: Colors.white)),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  child: GetBuilder<AdminController>(
                    init: Get.find<AdminController>(),
                    builder: (controller) => ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.productList.length,
                        itemBuilder: (context, index) {
                          Products product = controller.productList[index];          
                          String productName = "";
                          Category category = controller.getCategoryById(product.id_category!);
                          String categoryName = "";
                          if(category.name != null){
                            categoryName = category.name!;
                          }
                          if(product.name!.length >= 15){
                            productName = product.name!.substring(0,16) + "...";
                          }else{
                            productName = product.name!;
                          }
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: Dimensions.height10, horizontal: Dimensions.width10),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    Get.toNamed(Routes.getAdminProductDetailsView(index, "Update Item"));
                                  },
                                  child: Container(
                                    height: Dimensions.productImgSize,
                                    width: Dimensions.productImgSize,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(Dimensions.radius20),
                                        color: Colors.orange,
                                        image: DecorationImage(
                                          image: AssetImage("assets/images/food3.jpg"),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: Dimensions.productContainer,
                                    padding: EdgeInsets.symmetric(horizontal: Dimensions.height10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(Dimensions.radius20),
                                          bottomRight: Radius.circular(Dimensions.radius20),
                                        ),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0xFFe8e8e8),
                                            blurRadius: Dimensions.shadowBlurRadius,
                                            offset: Offset(0, 5),
                                          ),
                                        ]),
                                    child:  Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: Dimensions.width10,
                                                vertical: Dimensions.height10),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                bigText("${productName}"),
                                                smallText("${categoryName}", size:12),
                                              ],
                                            ),
                                          ),
                                          product.visibility == "1"
                                              ? GestureDetector(
                                                onTap:() {
                                                  controller.changeTheVisibility(index);
                                                },
                                                child: Container(
                                                  margin:EdgeInsets.only(right:Dimensions.width10),
                                                  child: Icon(Icons.visibility)
                                                ))
                                              : GestureDetector(
                                                onTap:() {
                                                  controller.changeTheVisibility(index);
                                                },
                                                child: Container(
                                                  margin:EdgeInsets.only(right:Dimensions.width10),
                                                  child: Icon(Icons.visibility_off_outlined)
                                                )),
                                        ],
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          );
                        },
                      ),
                  ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
  
}
