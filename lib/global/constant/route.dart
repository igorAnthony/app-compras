import 'package:eisteintaste/modules/admin/binding/admin_binding.dart';
import 'package:eisteintaste/modules/admin/views/admin_add_product.dart';
import 'package:eisteintaste/modules/cart/bindings/cart_binding.dart';
import 'package:eisteintaste/modules/tabbar/bindings/tabbar_binding.dart';
import 'package:eisteintaste/modules/tabbar/tabbar_view.dart';
import 'package:eisteintaste/modules/cart/views/cart_view.dart';
import 'package:eisteintaste/modules/food/views/food_body_view.dart';
import 'package:eisteintaste/modules/login/bindings/login_binding.dart';
import 'package:eisteintaste/modules/login/views/login_view.dart';
import 'package:eisteintaste/modules/orders/bindings/orders_bindings.dart';
import 'package:eisteintaste/modules/orders/views/orders_view.dart';
import 'package:eisteintaste/modules/popular/bindings/popular_binding.dart';
import 'package:eisteintaste/modules/profile/views/profile_view.dart';
import 'package:eisteintaste/modules/recommended/bindings/recommended_bindings.dart';
import 'package:eisteintaste/modules/recommended/views/recommended_food_detail.dart';
import 'package:eisteintaste/modules/register/bindings/register_binding.dart';
import 'package:eisteintaste/modules/register/views/register_view.dart';
import 'package:eisteintaste/modules/popular/views/popular_food_details_view.dart';
import 'package:eisteintaste/modules/food/views/food_view.dart';
import 'package:eisteintaste/modules/welcome/welcome_view.dart';
import 'package:get/get.dart';

class Routes{
  static const welcomeRoute = '/welcome';
  static const loginRoute = '/login';
  static const registerRoute = '/register';
  static const homeRoute = '/home';
  static const foodPageRoute = '/food';
  static const foodBodyRoute = '/foodbody';
  static const ordersRoute = '/orders';
  static const cartRoute = '/cart';
  static const profileRoute = '/profile';
  static const loggedRoute = '/logged';
  static const popularFoodDetailsRoute = '/popular';
  static const recommendedFoodDetailsRoute = '/recommended';
  static const adminRoute = '/admin';
  static String getWelcomeView()=>'$welcomeRoute';
  static String getPopularFood(int pageId) => '$popularFoodDetailsRoute?pageId=$pageId';
  static String getRecommendedFood(int pageId) => '$recommendedFoodDetailsRoute?pageId=$pageId';
  static String getCart(String page) => '$cartRoute?page=$page';
  static String getAdminView()=>'$adminRoute';
  static String getAdminProductDetailsView(int? productId, String pageName){
    print("enrtei");
    if(productId != null){
      return '$adminRoute?productId=$productId&pageName=$pageName';
    }else{
      return '$adminRoute?pageName=$pageName';
    }
    
  }
  static List<GetPage> getPages = [
  
  GetPage(
    name: welcomeRoute,
    page: () => WelcomeView(),
  ),
  GetPage(
    name: loginRoute,
    page: () => LoginView(),
    binding: LoginBinding(),
    transition: Transition.rightToLeft
  ),
  GetPage(
    name: registerRoute,
    page: () => RegisterView(),
    binding: RegisterBinding(),
  ),
  GetPage(
    name: homeRoute,
    page: () => TabbarView(),
    binding: TabbarBinding()
  ),
  GetPage(
    name: foodPageRoute,
    page: () => FoodView(),
  ),
   GetPage(
    name: foodBodyRoute,
    page: () => FoodBodyView(),
    bindings: [
      PopularBinding(),
      RecommendedBinding(),
    ], 
  ),
  GetPage(
    name: popularFoodDetailsRoute,
    page: () {
      var pageId = Get.parameters['pageId'];
      return PopularFoodDetailsView(pageId:int.parse(pageId!));
    },
    binding: PopularBinding(),
    transition: Transition.fadeIn
  ),
  GetPage(
    name: recommendedFoodDetailsRoute,
    page: () {
      var pageId = Get.parameters['pageId'];
      return RecommendedFoodDetailsView(pageId: int.parse(pageId!));
    },
    binding: RecommendedBinding(),
    transition: Transition.fadeIn
  ),
  GetPage(
    name: ordersRoute,
    page: () => OrdersView(),
    binding: OrdersBinding(),
  ),
  GetPage(
    name: cartRoute,
    page: () {
      var page = Get.parameters['page'];
      return CartView(page:page!);
    },
    binding: CartBinding()
  ),
  GetPage(
    name: profileRoute,
    page: () => ProfileView(),
  ),
  GetPage(
    name: adminRoute,
    page: () {
      var productId = Get.parameters['productId'];
      var pageName = Get.parameters['pageName'] ?? "";

      if(productId == null){
        return AdminProductDetailsView(pageName: pageName);
      }else{
        return AdminProductDetailsView(pageName: pageName, productId: int.parse(productId));
      } 
    },
    binding: AdminBinding(),
    transition: Transition.fadeIn
  ),
];
}
