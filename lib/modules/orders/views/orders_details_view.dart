import 'package:eisteintaste/models/payment_voucher_model.dart';
import 'package:eisteintaste/global/constant/colors.dart';
import 'package:eisteintaste/global/constant/dimensions.dart';
import 'package:eisteintaste/global/widgets/text.dart';
import 'package:eisteintaste/modules/orders/controller/orders_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersDetailsView extends StatelessWidget {
  final int order_id;
  OrdersDetailsView({super.key, required this.order_id});

  @override
  Widget build(BuildContext context) {
    OrdersController controller = Get.find();
    //print('teste'+order_id.toString());
    return SafeArea(
      child: Scaffold(
        body: Obx( () => controller.isLoading.value ? Center(child: CircularProgressIndicator(color:AppColors.mainColor)) : Container(
            margin: EdgeInsets.all(Dimensions.width15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: InkWell(
                        onTap: () {
                          Get.back();
                          controller.reset();
                        },
                        child: Container(
                          width: Dimensions.iconSize24,
                          height: Dimensions.iconSize24,
                          child: Icon(Icons.arrow_back_ios)),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        bigText('DETALHES DO PEDIDO'),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    smallText('Order n°${order_id}', size: Dimensions.font14),
                    SizedBox(
                      width: Dimensions.width5,
                    ),
                    Icon(
                      Icons.fiber_manual_record,
                      size: Dimensions.height3,
                    ),
                    SizedBox(
                      width: Dimensions.width5,
                    ),
                    smallText('27/05/2023 at 19:25', size: Dimensions.font14),
                  ],
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                GetBuilder<OrdersController>(
                    init: controller,
                    builder: (controller) {
                      final items = controller.ordersListItems;
                      return Column(
                        children: [
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              PaymentVoucher voucher = items[index];
                              return Container(
                                margin: EdgeInsets.only(bottom: Dimensions.height20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: Dimensions.listViewImgSizeOrders,
                                          width:Dimensions.listViewImgSizeOrders,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.radius10),
                                            color: Colors.orange,
                                          ),
                                        ),
                                        SizedBox(width: Dimensions.width10),
                                        smallText('${voucher.quantity}x ${voucher.productName}', color: Colors.black, size: Dimensions.font12)
                                      ],
                                    ),
                                    smallText('\$ ${voucher.totalPrice}', color: Colors.black),
                                  ],
                                ),
                              );
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              bigText('Summary of values',
                                  size: Dimensions.font16),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: Dimensions.height10),
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Colors.grey, // cor da borda
                                  width: 1.0, // largura da borda
                                  style: BorderStyle.solid, // estilo da borda
                                ),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: Dimensions.height20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    smallText('Subtotal',
                                        color: AppColors.mainBlackColor,
                                        size: Dimensions.font14),
                                    smallText('\$ ${controller.subtotal}',
                                        color: AppColors.mainBlackColor,
                                        size: Dimensions.font14),
                                  ],
                                ),
                                SizedBox(
                                  height: Dimensions.height20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    smallText('Descontos',
                                        color: AppColors.mainBlackColor,
                                        size: Dimensions.font14),
                                    smallText('\$ 0.0',
                                        color: AppColors.mainBlackColor,
                                        size: Dimensions.font14),
                                  ],
                                ),
                                SizedBox(
                                  height: Dimensions.height20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    smallText('Total',
                                        color: AppColors.mainBlackColor,
                                        size: Dimensions.font14),
                                    smallText('\$ ${controller.subtotal}',
                                        color: AppColors.mainBlackColor,
                                        size: Dimensions.font14),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
