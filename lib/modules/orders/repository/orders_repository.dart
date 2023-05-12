import 'package:app_compras/models/api_response.dart';
import 'package:app_compras/modules/orders/provider/orders_provider.dart';
import 'package:get/get.dart';

class OrdersRepository extends GetxService {
  final OrdersProvider ordersProvider;

  OrdersRepository({required this.ordersProvider});

  Future<ApiResponse> getOrdersList() async {
    return await ordersProvider.getOrdersList();
  }
  Future<ApiResponse> getItemsOfOrders(int orders_id) async {
    return await ordersProvider.getItemsOfOrders(orders_id);
  }
}