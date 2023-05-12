import 'package:app_compras/models/api_response.dart';
import 'package:app_compras/models/orders_model.dart';
import 'package:app_compras/modules/orders/repository/orders_repository.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  OrdersRepository ordersRepository = Get.find<OrdersRepository>();

  List<dynamic> _ordersList = [];
  List<dynamic> get ordersList => _ordersList;
  List<dynamic> _ordersListItems = [];
  List<dynamic> get ordersListItems => _ordersListItems;
  double subtotal = 0;
  RxBool isLoading = true.obs;

  @override
  void onInit(){
    getOrdersList();
    super.onInit();
  }
  Future<void> getOrdersList() async {
    ApiResponse response = await ordersRepository.getOrdersList();
    _ordersList.addAll(response.data as List<dynamic>);
    update();
  }
  Future<void> getItemsOfOrders(Orders order) async {
    ApiResponse response = await ordersRepository.getItemsOfOrders(order.id!);
    _ordersListItems.addAll(response.data as List<dynamic>);
    double sum_subtotal = 0;
    for (var voucher in _ordersListItems) {
      sum_subtotal += voucher.totalPrice!; 
    }
    subtotal = sum_subtotal;
    isLoading.value = false;
    update();
    
  }
  void reset(){
    _ordersListItems = [];
    isLoading.value = true;
  }
}