import 'package:eisteintaste/models/api_response.dart';
import 'package:eisteintaste/modules/recommended/provider/recommended_provider.dart';
import 'package:get/get.dart';

class RecommendedRepository extends GetxService {
  final RecommendedProvider recommendedProvider;

  RecommendedRepository({required this.recommendedProvider});

  Future<ApiResponse> getRecommendedProductList() async {
    return await recommendedProvider.getRecommendedList();
  }
}