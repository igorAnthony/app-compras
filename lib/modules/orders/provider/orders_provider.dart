import 'dart:convert';

import 'package:app_compras/models/api_response.dart';
import 'package:app_compras/models/orders_model.dart';
import 'package:app_compras/models/payment_voucher_model.dart';
import 'package:app_compras/global/constant/api_constant.dart';
import 'package:http/http.dart' as http;
class OrdersProvider{
  Future<ApiResponse> getOrdersList() async {
    ApiResponse apiResponse = ApiResponse();

    try {
      final userId = box.read('user');
      final response = await http.get(Uri.parse(ApiConstants.ordersURL+'/${userId}'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${box.read('token')}'
          });
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
}