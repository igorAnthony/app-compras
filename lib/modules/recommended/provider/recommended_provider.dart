import 'dart:convert';

import 'package:eisteintaste/models/api_response.dart';
import 'package:eisteintaste/models/products_model.dart';
import 'package:eisteintaste/global/constant/api_constant.dart';
import 'package:http/http.dart' as http;
class RecommendedProvider{
  Future<ApiResponse> getRecommendedList() async {
    ApiResponse apiResponse = ApiResponse();

    try {
      //print('/${box.read('user_id')}');
      final userId = box.read('user');
      final response = await http.get(Uri.parse(ApiConstants.recommendedURL + '/${userId}'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${box.read('token')}'
          });
      switch (response.statusCode) {
        case 200:
          apiResponse.data = jsonDecode(response.body)['products']
              .map((p) => Products.fromJson(p))
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