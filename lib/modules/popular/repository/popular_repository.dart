import 'package:eisteintaste/models/api_response.dart';
import 'package:eisteintaste/modules/popular/provider/popular_provider.dart';

class PopularRepository{
  final PopularProvider popularProvider;

  PopularRepository({required this.popularProvider});

  Future<ApiResponse> getPopularProductList() async {
    return await popularProvider.getPopularList();
  }
}