import 'package:app_compras/global/constant/colors.dart';
import 'package:app_compras/global/constant/decoration.dart';
import 'package:app_compras/global/constant/dimensions.dart';
import 'package:app_compras/global/widgets/app_icon.dart';
import 'package:app_compras/global/widgets/text.dart';
import 'package:app_compras/modules/admin/controller/admin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminProductDetailsView extends GetView<AdminController>{
  final String pageName;
  final int? productId;

  AdminProductDetailsView({required this.pageName, this.productId});

  @override
  Widget build(BuildContext context) {
    if(this.productId != null){
      controller.updateTheValues(this.productId!);
    }else{
      controller.reset();
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.only(left: Dimensions.width20, top: Dimensions.height20, bottom: Dimensions.height10),
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
                  width: double.maxFinite,
                  margin: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: bigText("${pageName}", color: AppColors.iconColor1, weight: FontWeight.w500, size: Dimensions.font24),
                      ),
                      SizedBox(height: Dimensions.height40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                        ],
                      ),
                      SizedBox(height: Dimensions.height40),
                      kMaterialDecoration(
                        borderRadius: Dimensions.border10,
                        TextFormField(
                          controller: controller.nameController,
                          keyboardType: TextInputType.name,
                          enableSuggestions: false,
                          autocorrect: false,
                          validator: (val) => val!.isEmpty ? 'Invalid name' : null,
                          decoration: kInputDecoration('Food name', Icons.fastfood, iconColor: AppColors.iconColor1),
                        ),
                      ),
                      SizedBox(height: Dimensions.height20),
                      kMaterialDecoration(
                        borderRadius: Dimensions.border10,
                        TextFormField(
                          controller: controller.descriptionController,
                          keyboardType: TextInputType.multiline,
                          enableSuggestions: true,
                          autocorrect: true,
                          textAlign: TextAlign.left,
                          maxLines: 3,
                          maxLength: 1000,
                          validator: (val) => val!.isEmpty ? 'Invalid description' : null,
                          decoration: kInputDecoration('Description', Icons.comment, iconColor: AppColors.iconColor1),
                        ),
                      ),
                      SizedBox(height: Dimensions.height20),
                      kMaterialDecoration(
                        sizeMax: 150,
                        borderRadius: Dimensions.border10,
                        TextFormField(
                          controller: controller.priceController,
                          keyboardType: TextInputType.number,
                          enableSuggestions: true,
                          autocorrect: true,
                          validator: (val) => val!.isEmpty ? 'Invalid price' : null,
                          decoration: kInputDecoration('Price', Icons.money, iconColor: AppColors.iconColor1),
                        ),
                      ),
                      SizedBox(height: Dimensions.height10,),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(
                              () => Checkbox(
                                value: controller.isChecked.value, 
                                onChanged: (bool? value) {
                                  controller.isChecked.value = !controller.isChecked.value;
                                },
                              )
                            ),
                            Expanded(
                              child: Container(
                                child: smallText("Do you want the item to be displayed on the sales screen?", size: Dimensions.font14, color: Colors.black)
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: Dimensions.height30),
                      Container(
                        width: double.maxFinite,
                        child: kTextButton("Save", (){
                          if(this.productId != null){
                            controller.editItem(productId!);
                          }else{
                            controller.addItem();
                          }
                          Get.back();
                        }, backgroundColor: AppColors.iconColor1)
                      ),
                      SizedBox(height: Dimensions.height30),
                      controller.isUpdated ? Container(
                        child: GestureDetector(
                          onTap: () {
                            controller.deleteItem(productId!);
                            Get.back();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.delete, color: Color.fromARGB(255, 105, 15, 15)),
                              SizedBox(width: Dimensions.width5),
                              bigText("Remover item", color: Color.fromARGB(255, 105, 15, 15),),
                            ],
                          ),
                        ),
                      ) : Container()
                  ]),
                ),
            ]),
          ),
        )
      ) 
    );
  }
}
