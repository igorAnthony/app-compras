import 'package:eisteintaste/models/api_response.dart';
import 'package:eisteintaste/modules/food/provider/product_provider.dart';

class ProductRepository{
  final ProductProvider productProvider;
  
  ProductRepository({required this.productProvider});

  Future<ApiResponse> getAllProducts() async {
    return await productProvider.getAllProducts();
  }
  
}
  