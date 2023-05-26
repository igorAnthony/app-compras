import 'dart:convert';
import 'package:app_compras/models/api_response.dart';
import 'package:app_compras/models/category_model.dart';
import 'package:app_compras/global/constant/api_constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CategoryProvider extends GetxService{
  Future<ApiResponse> getCategoryList() async {
    ApiResponse apiResponse = ApiResponse();
    try {
      final response = await http.get(Uri.parse(ApiConstants.categoryURL),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${box.read('token')}'
      });
      switch (response.statusCode) {
        case 200:
          apiResponse.data = jsonDecode(response.body)['categories']
              .map((p) => Category.fromJson(p))
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
      apiResponse.error = ApiConstants.serverError;
    }
    return apiResponse;
  }
  Future<ApiResponse> getCategoryById(int id_category) async{
    ApiResponse apiResponse = ApiResponse();

    try{
      final response = await http.post(Uri.parse(ApiConstants.categoryURL + '/$id_category'),
      headers: {
        'Accept' : 'application/json',
        'Authorization' : 'Bearer ${box.read('token')}'
      });

      switch(response.statusCode){
        case 200:
          apiResponse.data = Category.fromJson(jsonDecode(response.body)['categories']);
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
  Future<ApiResponse> createCategory(Category category) async{
    ApiResponse apiResponse = ApiResponse();

    try{
      final response = await http.post(Uri.parse(ApiConstants.categoryURL),
      headers: {
        'Accept' : 'application/json',
        'Authorization' : 'Bearer ${box.read('token')}'
      },
      body: {
        'name' : category.name,
      });

      switch(response.statusCode){
        case 200:
          apiResponse.data = Category.fromJson(jsonDecode(response.body)['categories']);
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
  Future<ApiResponse> editCategory(Category category) async{
    ApiResponse apiResponse = ApiResponse();
    try{
      final response = await http.put(Uri.parse(ApiConstants.categoryURL + '/${category.id}'),
      headers: {
        'Accept' : 'application/json',
        'Authorization' : 'Bearer ${box.read('token')}'
      }, 
      body : {
        'name' : category.name,
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

  Future<ApiResponse> deleteCategory(int categoryId) async{
    ApiResponse apiResponse = ApiResponse();

    try{
      final response = await http.delete(Uri.parse(ApiConstants.categoryURL + '/$categoryId'),
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

