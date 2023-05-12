import 'package:get_storage/get_storage.dart';

class ApiConstants {
  static const baseURL = 'http://192.168.0.114:8000/api';
  static const loginURL = baseURL + '/login';
  static const registerURL = baseURL + '/register';
  static const logoutURL = baseURL + '/logout';
  static const userURL = baseURL + '/user';
  static const productsURL = baseURL + '/products';
  static const ordersURL = baseURL + '/orders';
  static const ordersItemsURL = baseURL + '/ordersitems';
  static const popularURL = ordersItemsURL + '/popular';
  static const recommendedURL = ordersItemsURL + '/recommended';

  static const serverError = 'Server error';
  static const unauthorized = 'Unauthorized';
  static const somethingWentWrong = 'Something went wrong, try again!';

  static const String token = "";
}

final box = GetStorage();
