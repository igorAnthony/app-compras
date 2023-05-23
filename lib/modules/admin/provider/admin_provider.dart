import 'dart:convert';

import 'package:app_compras/models/api_response.dart';
import 'package:app_compras/models/products_model.dart';
import 'package:app_compras/global/constant/api_constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AdminProvider extends GetxService{
  Future<ApiResponse> changeVisibility(int product_id) async {
    ApiResponse apiResponse = ApiResponse();
    try {
      final response = await http.put(Uri.parse(ApiConstants.productsURL + "/${product_id}/visibility"),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${box.read('token')}'
      });
      switch (response.statusCode) {
        case 200:
          break;
        case 404:
          apiResponse.error = jsonDecode(response.body)['message'];
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
  Future<ApiResponse> getProductList() async {
    ApiResponse apiResponse = ApiResponse();
    try {
      final response = await http.get(Uri.parse(ApiConstants.productsURL),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${box.read('token')}'
      });
      print(response);
      switch (response.statusCode) {
        case 200:
          apiResponse.data = jsonDecode(response.body)['products']
              .map((p) => Products.fromJson(p))
              .toList();
          apiResponse.data as List<dynamic>;
          //print("valor" + apiResponse.data.toString());
          break;
        case 404:
          apiResponse.error = jsonDecode(response.body)['message'];
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

