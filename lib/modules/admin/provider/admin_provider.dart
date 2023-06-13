import 'dart:convert';

import 'package:eisteintaste/models/api_response.dart';
import 'package:eisteintaste/models/products_model.dart';
import 'package:eisteintaste/global/constant/api_constant.dart';
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
      switch (response.statusCode) {
        case 200:
          print(jsonDecode(response.body)['products']);
          apiResponse.data = jsonDecode(response.body)['products']
              .map((p) => Products.fromJson(p))
              .toList();
          apiResponse.data as List<dynamic>;
          break;
        case 404:
          apiResponse.error = jsonDecode(response.body)['message'];
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
  Future<ApiResponse> createProduct(Products product) async{
    ApiResponse apiResponse = ApiResponse();
    print("${product.id_category}");    
    try{
      final response = await http.post(Uri.parse(ApiConstants.productsURL),
      headers: {
        'Accept' : 'application/json',
        'Authorization' : 'Bearer ${box.read('token')}'
      },
      body: {
        'name' : product.name,
        'description' : product.description,
        'id_category': "${product.id_category}",
        'price' : product.price.toString(),
        'visibility' : product.visibility
      });
      
      switch(response.statusCode){
        case 200:
          apiResponse.data = Products.fromJson(jsonDecode(response.body)['product']);
          break;
        case 403:
          apiResponse.error = jsonDecode(response.body)['message'];
          break;
        case 401:
          apiResponse.error = ApiConstants.unauthorized;
          break;
        default:
          apiResponse.error = ApiConstants.somethingWentWrong;
          break;
      }
    } catch (e){
      print(e);
      apiResponse.error = ApiConstants.serverError;
    }
    return apiResponse;
  }
  Future<ApiResponse> editProduct(Products product) async{
    ApiResponse apiResponse = ApiResponse();
    try{
      final response = await http.put(Uri.parse(ApiConstants.productsURL + '/${product.id}'),
      headers: {
        'Accept' : 'application/json',
        'Authorization' : 'Bearer ${box.read('token')}'
      }, 
      body : {
        'name' : product.name,
        'description' : product.description,
        'id_category': "${product.id_category}",
        'price' : product.price.toString(),
        'visibility' : product.visibility,
        
      });
      print(response.statusCode);
      switch(response.statusCode){
        case 200:
          apiResponse.data = jsonDecode(response.body)['message'];
          break;
        case 403:
          apiResponse.error = jsonDecode(response.body)['message'];
          break;
        case 401:
          apiResponse.error = ApiConstants.unauthorized;
          break;
        default:
          apiResponse.error = ApiConstants.somethingWentWrong;
          break;
      }
    } catch (e){
      //print(e);
      apiResponse.error = ApiConstants.serverError;
    }
    return apiResponse;
  }

  Future<ApiResponse> deleteProduct(int postId) async{
    ApiResponse apiResponse = ApiResponse();

    try{
      final response = await http.delete(Uri.parse(ApiConstants.productsURL + '/$postId'),
      headers: {
        'Accept' : 'application/json',
        'Authorization' : 'Bearer ${box.read('token')}'
      });
      switch(response.statusCode){
        case 200:
          apiResponse.data = jsonDecode(response.body)['message'];
          break;
        case 403:
          apiResponse.error = jsonDecode(response.body)['message'];
          break;
        case 401:
          apiResponse.error = ApiConstants.unauthorized;
          break;
        default:
          apiResponse.error = ApiConstants.somethingWentWrong;
          break;
      }
    } catch (e){
      apiResponse.error = ApiConstants.serverError;
    }
    return apiResponse;
  }
}

