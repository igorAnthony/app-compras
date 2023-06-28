import 'package:eisteintaste/models/address_model.dart';
import 'package:eisteintaste/models/api_response.dart';
import 'package:eisteintaste/modules/address/provider/address_provider.dart';
import 'package:get/get.dart';

class AddressRepository extends GetxService {
  final AddressProvider addressProvider;

  AddressRepository({required this.addressProvider});

  Future<ApiResponse> getUserAddress(int user_id) async {
    final response = await addressProvider.getUserAddress(user_id);
    return response;
  }
  Future<ApiResponse> addAddress(Address address) async{
    final response = await addressProvider.addAddress(address);
    return response;
  }
  Future<ApiResponse> editAddress(Address address) async{
    final response = await addressProvider.editAddress(address);
    return response;
  }
  // Future<ApiResponse> getProductList() async {
  //   final response = await adminProvider.getProductList();
  //   return response;
  // }
  // Future<ApiResponse> createProduct(Products product) async {
  //   final response = await adminProvider.createProduct(product);
  //   return response;
  // }
  // Future<ApiResponse> editProduct(Products product) async {
  //   final response = await adminProvider.editProduct(product);
  //   return response;
  // }
  // Future<ApiResponse> deleteProduct(int id) async {
  //   final response = await adminProvider.deleteProduct(id);
  //   return response;
  // }
}