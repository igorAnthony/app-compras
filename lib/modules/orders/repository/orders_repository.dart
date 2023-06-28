import 'package:eisteintaste/models/api_response.dart';
import 'package:eisteintaste/modules/cart/model/cart_model.dart';
import 'package:eisteintaste/modules/orders/provider/orders_provider.dart';
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
  Future<ApiResponse> createOrder(int customerId, double totalPrice) async {
    return await ordersProvider.createOrder(customerId, totalPrice);
  }
  Future<ApiResponse> createOrderItems(int orders_id, List<Cart> items) async {
    return await ordersProvider.createOrderItems(orders_id, items);
  }
}