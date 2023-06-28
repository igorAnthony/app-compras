import 'dart:convert';

import 'package:eisteintaste/models/address_model.dart';
import 'package:eisteintaste/models/api_response.dart';
import 'package:eisteintaste/global/constant/api_constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AddressProvider extends GetxService{

  Future<ApiResponse> getUserAddress(int user_id) async{
    ApiResponse apiResponse = ApiResponse();

    try{
      final response = await http.get(Uri.parse(ApiConstants.addressURL + '/$user_id'),
      headers: {
        'Accept' : 'application/json',
        'Authorization' : 'Bearer ${box.read('token')}'
      });
      print(response.body);
      switch(response.statusCode){
        case 200:
          apiResponse.data = jsonDecode(response.body)['addresses'].map((p) => Address.fromJson(p)).toList();
          print(apiResponse.data);
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

  Future<ApiResponse> addAddress(Address newAddress) async {
    ApiResponse apiResponse = ApiResponse();

    try{
      final response = await http.post(Uri.parse(ApiConstants.addressURL),
      headers: {
        'Accept' : 'application/json',
        'Authorization' : 'Bearer ${box.read('token')}'
        
      },
      body: jsonEncode(newAddress.toJson())
      );
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

  Future<ApiResponse> editAddress(Address updatedAddress) async {
    ApiResponse apiResponse = ApiResponse();
    print("to aq");
    try{
      final response = await http.put(Uri.parse(ApiConstants.addressURL + '/${updatedAddress.id}'),
      headers: {
        'Accept' : 'application/json',
        'Authorization' : 'Bearer ${box.read('token')}'
      },
      body: {
        'addresType' : updatedAddress.addressType,
        'address' : updatedAddress.address,
        'latitude': updatedAddress.latitude,
        'longitude': updatedAddress.longitude,
        'contact_person_number' : updatedAddress.contactPersonNumber,
        'contact_person_name' : updatedAddress.contactPersonName,
      }
      
      );print(response.body);
      switch(response.statusCode){
        case 200:
          apiResponse.data = jsonDecode(response.body)['message'];
          print(apiResponse.data);
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
      print("erro: $e");
      apiResponse.error = ApiConstants.serverError;
    }
    return apiResponse;
  }
}
