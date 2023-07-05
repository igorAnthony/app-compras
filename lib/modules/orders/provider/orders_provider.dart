import 'dart:convert';

import 'package:eisteintaste/models/api_response.dart';
import 'package:eisteintaste/models/orders_model.dart';
import 'package:eisteintaste/models/payment_voucher_model.dart';
import 'package:eisteintaste/global/constant/api_constant.dart';
import 'package:eisteintaste/modules/cart/model/cart_model.dart';
import 'package:eisteintaste/modules/profile/controller/user_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class OrdersProvider{
  Future<ApiResponse> getOrdersList() async {
    ApiResponse apiResponse = ApiResponse();

    try {
      final userId = Get.find<UserController>().user.id;
      final response = await http.get(Uri.parse(ApiConstants.ordersURL+'/${userId}'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${box.read('token')}'
          });
      print(response.body);
      switch (response.statusCode) {
        case 200:
          apiResponse.data = jsonDecode(response.body)['orders']
              .map((p) => Orders.fromJson(p))
              .toList();
          apiResponse.data as List<dynamic>;
          break;
        case 401:
          apiResponse.error = ApiConstants.unauthorized;

          break;
        default:
          apiResponse.error = ApiConstants.somethingWentWrong;

          break;
      }
    } catch (e) {
      print(e);
      apiResponse.error = ApiConstants.serverError;
    }
    return apiResponse;
  }
  Future<ApiResponse> getItemsOfOrders(int orders_id) async {
    ApiResponse apiResponse = ApiResponse();

    try {
      final response = await http.get(Uri.parse('${ApiConstants.baseURL}/${orders_id}/ordersitems'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${box.read('token')}'
          });
      switch (response.statusCode) {
        case 200:
          apiResponse.data = jsonDecode(response.body)['paymentvoucher']
              .map((p) => PaymentVoucher.fromJson(p))
              .toList();
          apiResponse.data as List<dynamic>;
          break;
        case 401:
          apiResponse.error = ApiConstants.unauthorized;

          break;
        default:
          apiResponse.error = ApiConstants.somethingWentWrong;

          break;
      }
    } catch (e) {
      apiResponse.error = ApiConstants.serverError;
    }
    return apiResponse;
  }
  Future<ApiResponse> createOrder(int customerId, double totalAmount, String? payment_method, int address_id) async {
    ApiResponse apiResponse = ApiResponse();

    try {
      final url = Uri.parse('${ApiConstants.ordersURL}');
      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${box.read('token')}',
      };
      final body = jsonEncode({
        'customer_id': customerId,
        'total_amount': totalAmount,
        'payment_method': payment_method,
        'address_id': address_id,
      });
      
      final response = await http.post(url, headers: headers, body: body);
      print(response.statusCode);

      switch (response.statusCode) {
        case 200:
          apiResponse.data = jsonDecode(response.body)['order_id'];
          break;
        case 401:
          apiResponse.error = ApiConstants.unauthorized;
          break;
        default:
          apiResponse.error = ApiConstants.somethingWentWrong;
          break;
      }
    } catch (e) {
      apiResponse.error = ApiConstants.serverError;
    }

    return apiResponse;
  }

  Future<ApiResponse> createOrderItems(int orderId, List<Cart> items) async {
    ApiResponse apiResponse = ApiResponse();

    try {
      final url = Uri.parse('${ApiConstants.ordersURL}/$orderId');
      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${box.read('token')}',
      };
      List<Map<String, dynamic>> itemsData = items.map((cart) => {
      'product_id': cart.product.id,
      'quantity': cart.quantity,
      'total_price': cart.product.price! * cart.quantity,
    }).toList();
      final body = jsonEncode({
        'items': itemsData,
        'order_id': orderId,
      });

      final response = await http.post(url, headers: headers, body: body);
      print(response.statusCode);
      switch (response.statusCode) {
        case 200:
          apiResponse.data = jsonDecode(response.body);
          break;
        case 401:
          apiResponse.error = ApiConstants.unauthorized;
          break;
        default:
          apiResponse.error = ApiConstants.somethingWentWrong;
          break;
      }
    } catch (e) {
      print(e);
      apiResponse.error = ApiConstants.serverError;
    }

    return apiResponse;
  }
}