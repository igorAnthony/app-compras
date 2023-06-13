import 'package:eisteintaste/models/orders_model.dart';
import 'package:eisteintaste/global/constant/colors.dart';
import 'package:eisteintaste/global/constant/dimensions.dart';
import 'package:eisteintaste/global/widgets/text.dart';
import 'package:eisteintaste/modules/orders/controller/orders_controller.dart';
import 'package:eisteintaste/modules/orders/views/orders_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({super.key});

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  OrdersController ordersController = Get.find<OrdersController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<OrdersController>(
        init: ordersController,
        builder: (ordersController) {
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: ordersController.ordersList.length,
          itemBuilder: (context, index) {
            Orders order = ordersController.ordersList[index];
            return GestureDetector(
              onTap: () {
                ordersController.getItemsOfOrders(order);
                Get.to(OrdersDetailsView(order_id: order.id!));
              },
              child: Container(
                padding: EdgeInsets.all(Dimensions.border10),
                margin: EdgeInsets.symmetric(horizontal: Dimensions.width10, vertical: Dimensions.height3),
                decoration: BoxDecoration(
                 border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.grey.withOpacity(0.1),
                  )
                 )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: Dimensions.width10, vertical: Dimensions.height10),
                        child: smallText('order_id: ${order.id}'),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.border10,
                              vertical: Dimensions.border5),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.border5),
                            color: AppColors.mainColor,
                          ),
                          child: smallText('pending',
                              color: Colors.white, weight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.border10,
                              vertical: Dimensions.border5),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.border5),
                              border: Border.all(
                                color: AppColors.mainColor,
                                width: 1,
                              )),
                          child: Row(
                            children: [
                              Icon(
                                Icons.local_shipping,
                                size: Dimensions.iconSize16,
                              ),
                              SizedBox(
                                width: Dimensions.width5,
                              ),
                              smallText('track_order',
                                  color: AppColors.mainColor,
                                  weight: FontWeight.bold),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
